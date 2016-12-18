#include <map>

#include <glog/logging.h>

#include <svo/threadStereoImuVio.hpp>
#include <okvis/assert_macros.hpp>
#include <okvis/ceres/ImuError.hpp>
#include <okvis/IdProvider.hpp>

#include <svo/config.h>
#include <svo/frame_handler_mono.h>
#include <svo/map.h>
#include <svo/frame.h>
#include <svo/feature.h>
#include <svo/point.h>
#include <svo/pose_optimizer.h>
#include <svo/sparse_img_align.h>
#include <vikit/performance_monitor.h>
#include <svo/depth_filter.h>
#ifdef USE_BUNDLE_ADJUSTMENT
#include <svo/bundle_adjustment.h>
#endif


/// \brief okvis Main namespace of this package.
namespace okvis {

static const int max_camera_input_queue_size = 10;
static const okvis::Duration temporal_imu_data_overlap(0.02);  // overlap of imu data before and after two consecutive frames [seconds]


// Constructor.
ThreadedKFVio::ThreadedKFVio(okvis::VioParameters& parameters,vk::AbstractCamera* cam)
    : FrameHandlerBase(),
      cam_(cam),
      reprojector_(cam_, map_),
      depth_filter_(NULL),
      speedAndBiases_propagated_(okvis::SpeedAndBias::Zero()),
      imu_params_(parameters.imu),
      repropagationNeeded_(false),
      frameSynchronizer_(okvis::FrameSynchronizer(parameters)),
      lastAddedImageTimestamp_(okvis::Time(0, 0)),
      optimizationDone_(true),
      estimator_(),
      parameters_(parameters),
      maxImuInputQueueSize_(
          2 * max_camera_input_queue_size * parameters.imu.rate
              / parameters.sensors_information.cameraRate)
      {
	
  setBlocking(false);
  init();
  
  
}


// Initialises settings and calls startThreads().
void ThreadedKFVio::init() {
  assert(parameters_.nCameraSystem.numCameras() > 0);
  numCameras_ = parameters_.nCameraSystem.numCameras();
  numCameraPairs_ = 1;
  lastOptimizedStateTimestamp_ = okvis::Time(0.0) + temporal_imu_data_overlap;  // s.t. last_timestamp_ - overlap >= 0 (since okvis::time(-0.02) returns big number)
  lastAddedStateTimestamp_ = okvis::Time(0.0) + temporal_imu_data_overlap;  // s.t. last_timestamp_ - overlap >= 0 (since okvis::time(-0.02) returns big number)

  estimator_.addImu(parameters_.imu);
 
  StereoMeasurementsReceived_ =  std::shared_ptr<threadsafe::ThreadSafeQueue<std::shared_ptr<okvis::StereoMeasurement> > >
                                 (new threadsafe::ThreadSafeQueue<std::shared_ptr<okvis::StereoMeasurement> >());
  
				 
  svo::feature_detection::DetectorPtr feature_detector(
      new svo::feature_detection::FastDetector(
          cam_->width(), cam_->height(), svo::Config::gridSize(), svo::Config::nPyrLevels()));

  
  svo::DepthFilter::callback_t depth_filter_cb = boost::bind(
      &svo::MapPointCandidates::newCandidatePoint, &map_.point_candidates_, _1, _2);
  depth_filter_ = new svo::DepthFilter(feature_detector, depth_filter_cb);
  depth_filter_->startThread();
  
  // set up windows so things don't crash on Mac OS
  if(parameters_.visualization.displayImages){
    for (size_t im = 0; im < parameters_.nCameraSystem.numCameras(); im++) {
      std::stringstream windowname;
      windowname << "OKVIS camera " << im;
  	  cv::namedWindow(windowname.str());
    }
  }
  
  startThreads();
}

// Start all threads.
void ThreadedKFVio::startThreads() {

  // consumer threads
 
  stereoConsumerThread_ = std::thread(&ThreadedKFVio::stereoConsumerLoop, this);
  
  imuConsumerThread_ = std::thread(&ThreadedKFVio::imuConsumerLoop, this);
  
  //visualizationThread_  = std::thread(&ThreadedKFVio::visualizationLoop, this);

 
}

// Destructor. This calls Shutdown() for all threadsafe queues and joins all threads.
ThreadedKFVio::~ThreadedKFVio() {
  
  StereoMeasurementsReceived_->Shutdown();
 
  imuMeasurementsReceived_.Shutdown();
  optimizationResults_.Shutdown();
  visualizationData_.Shutdown();
  imuFrameSynchronizer_.shutdown();
  

  // consumer threads
 
  stereoConsumerThread_.join();
  imuConsumerThread_.join();
  
  //visualizationThread_.join();
 


  /*okvis::kinematics::Transformation endPosition;
  estimator_.get_T_WS(estimator_.currentFrameId(), endPosition);
  std::stringstream s;
  s << endPosition.r();
  LOG(INFO) << "Sensor end position:\n" << s.str();
  LOG(INFO) << "Distance to origin: " << endPosition.r().norm();*/
#ifndef DEACTIVATE_TIMERS
  LOG(INFO) << okvis::timing::Timing::print();
#endif
}

bool ThreadedKFVio::addStereo(const okvis::Time & stamp, 
                        const cv::Mat & image0, const cv::Mat & image1 ){


  if (lastAddedImageTimestamp_ > stamp
      && fabs((lastAddedImageTimestamp_ - stamp).toSec())
          > parameters_.sensors_information.frameTimestampTolerance) {
    LOG(ERROR)
        << "Received image from the past. Dropping the image.";
    return false;
  }
  lastAddedImageTimestamp_ = stamp;

  std::shared_ptr<okvis::StereoMeasurement> stereoframe = std::make_shared<
      okvis::StereoMeasurement>();
  stereoframe->measurement.image0 = image0;
  stereoframe->measurement.image1 = image1;
  
  stereoframe->timeStamp = stamp;
 


  stereoframe->measurement.deliversKeypoints0 = false;
  stereoframe->measurement.deliversKeypoints1 = false;


  if (blocking_) {
  
    StereoMeasurementsReceived_->PushBlockingIfFull(stereoframe,1);
    return true;
  } else {
   
    StereoMeasurementsReceived_->PushNonBlockingDroppingIfFull(stereoframe,max_camera_input_queue_size);
    return StereoMeasurementsReceived_->Size() == 1;
  }
  
}


// Add an IMU measurement.
bool ThreadedKFVio::addImuMeasurement(const okvis::Time & stamp,
                                      const Eigen::Vector3d & alpha,
                                      const Eigen::Vector3d & omega) {

  okvis::ImuMeasurement imu_measurement;
  imu_measurement.measurement.accelerometers = alpha;
  imu_measurement.measurement.gyroscopes = omega;
  imu_measurement.timeStamp = stamp;

  if (blocking_) {
    imuMeasurementsReceived_.PushBlockingIfFull(imu_measurement, 1);
    return true;
  } else {
    imuMeasurementsReceived_.PushNonBlockingDroppingIfFull(
        imu_measurement, maxImuInputQueueSize_);
    return imuMeasurementsReceived_.Size() == 1;
  }
}


// Set the blocking variable that indicates whether the addMeasurement() functions
// should return immediately (blocking=false), or only when the processing is complete.
void ThreadedKFVio::setBlocking(bool blocking) {
  blocking_ = blocking;
  // disable time limit for optimization
  if(blocking_) {
    std::lock_guard<std::mutex> lock(estimator_mutex_);
    estimator_.setOptimizationTimeLimit(-1.0,parameters_.optimization.max_iterations);
  }
}



// Loop to process frames from camera with index cameraIndex
void ThreadedKFVio::stereoConsumerLoop() {
  std::shared_ptr<okvis::StereoMeasurement> stereoframe;
  std::shared_ptr<okvis::MultiFrame> multiFrame;
 

  for (;;) {
    // get data and check for termination request
    
    //从buffer中取出数据
    if (StereoMeasurementsReceived_->PopBlocking(&stereoframe) == false) {
      return;
    }
    
    
    okvis::Time frame_stamp = stereoframe->timeStamp;
    //std::cout<<stereoframe->timeStamp<<std::endl;
    multiFrame = std::shared_ptr<okvis::MultiFrame>(new okvis::MultiFrame(parameters_.nCameraSystem,frame_stamp,
                                                                          okvis::IdProvider::instance().newId()));
    multiFrame->setImage(0,stereoframe->measurement.image0);
    multiFrame->setImage(1,stereoframe->measurement.image1);
    
    okvis::kinematics::Transformation T_WS;
    okvis::Time lastTimestamp;
    okvis::SpeedAndBias speedAndBiases;
    // copy last state variables
    {
     
      std::lock_guard<std::mutex> lock(lastState_mutex_);
     
      T_WS = lastOptimized_T_WS_;
      speedAndBiases = lastOptimizedSpeedAndBiases_;
      lastTimestamp = lastOptimizedStateTimestamp_;
    }

    // -- get relevant imu messages for new state
    okvis::Time imuDataEndTime = multiFrame->timestamp() + temporal_imu_data_overlap;
    okvis::Time imuDataBeginTime = lastTimestamp - temporal_imu_data_overlap;

    OKVIS_ASSERT_TRUE_DBG(Exception,imuDataBeginTime < imuDataEndTime,"imu data end time is smaller than begin time.");

    // wait until all relevant imu messages have arrived and check for termination request
    // 等待 imuDataEndTime 时刻的imu到来，才往下走
    if (imuFrameSynchronizer_.waitForUpToDateImuData(okvis::Time(imuDataEndTime)) == false)  {
      return;
    }
    OKVIS_ASSERT_TRUE_DBG(Exception,
                          imuDataEndTime < imuMeasurements_.back().timeStamp,
                          "Waiting for up to date imu data seems to have failed!");

    okvis::ImuMeasurementDeque imuData = getImuMeasurments(imuDataBeginTime,
                                                           imuDataEndTime);
    
    /*
    std::cout<<"imuDataBeginTime "<<imuDataBeginTime<<std::endl;
    std::cout<<"multiFrame->timestamp() "<<multiFrame->timestamp()<<std::endl;
    std::cout<<"imuDataEndTime "<<imuDataEndTime<<std::endl;
    */
   
    std::stringstream windowname;
    windowname << "OKVIS camera " ;
    cv::imshow(windowname.str(), stereoframe->measurement.image0);
    cv::waitKey(30);
    
    int moveimu = deleteImuMeasurements(imuDataBeginTime);
    std::cout<<"imudata "<<imuData.size()<<" "<<moveimu<<std::endl;
    
    lastOptimizedStateTimestamp_ = multiFrame->timestamp();
    
    
    
    

   
  }
}


// Loop to process IMU measurements.
void ThreadedKFVio::imuConsumerLoop() {
  okvis::ImuMeasurement data;
  TimerSwitchable processImuTimer("0 processImuMeasurements",true);
  for (;;) {
    // get data and check for termination request
    if (imuMeasurementsReceived_.PopBlocking(&data) == false)
      return;
    processImuTimer.start();
    okvis::Time start;
    const okvis::Time* end;  // do not need to copy end timestamp
    {
      std::lock_guard<std::mutex> imuLock(imuMeasurements_mutex_);
      OKVIS_ASSERT_TRUE(Exception,
                        imuMeasurements_.empty()
                        || imuMeasurements_.back().timeStamp < data.timeStamp,
                        "IMU measurement from the past received");

      if (parameters_.publishing.publishImuPropagatedState) {
        if (!repropagationNeeded_ && imuMeasurements_.size() > 0) {
          start = imuMeasurements_.back().timeStamp;
        } else if (repropagationNeeded_) {
          std::lock_guard<std::mutex> lastStateLock(lastState_mutex_);
          start = lastOptimizedStateTimestamp_;
          T_WS_propagated_ = lastOptimized_T_WS_;
          speedAndBiases_propagated_ = lastOptimizedSpeedAndBiases_;
          repropagationNeeded_ = false;
        } else
          start = okvis::Time(0, 0);
        end = &data.timeStamp;
      }
      imuMeasurements_.push_back(data);
    }  // unlock _imuMeasurements_mutex

    // notify other threads that imu data with timeStamp is here.
    imuFrameSynchronizer_.gotImuData(data.timeStamp);

    
    /*
    if (parameters_.publishing.publishImuPropagatedState) {
      Eigen::Matrix<double, 15, 15> covariance;
      Eigen::Matrix<double, 15, 15> jacobian;

      propagation(imuMeasurements_, imu_params_, T_WS_propagated_,
                            speedAndBiases_propagated_, start, *end, &covariance,
                            &jacobian);
      OptimizationResults result;
      result.stamp = *end;
      result.T_WS = T_WS_propagated_;
      result.speedAndBiases = speedAndBiases_propagated_;
      result.omega_S = imuMeasurements_.back().measurement.gyroscopes
          - speedAndBiases_propagated_.segment<3>(3);
      for (size_t i = 0; i < parameters_.nCameraSystem.numCameras(); ++i) {
        result.vector_of_T_SCi.push_back(
            okvis::kinematics::Transformation(
                *parameters_.nCameraSystem.T_SC(i)));
      }
      result.onlyPublishLandmarks = false;
      optimizationResults_.PushNonBlockingDroppingIfFull(result,1);
    }
    
    */
    processImuTimer.stop();
  }
}


// Get a subset of the recorded IMU measurements.
okvis::ImuMeasurementDeque ThreadedKFVio::getImuMeasurments(
    okvis::Time& imuDataBeginTime, okvis::Time& imuDataEndTime) {
  // sanity checks:
  // if end time is smaller than begin time, return empty queue.
  // if begin time is larger than newest imu time, return empty queue.
  if (imuDataEndTime < imuDataBeginTime
      || imuDataBeginTime > imuMeasurements_.back().timeStamp)
    return okvis::ImuMeasurementDeque();

  std::lock_guard<std::mutex> lock(imuMeasurements_mutex_);
  // get iterator to imu data before previous frame
  okvis::ImuMeasurementDeque::iterator first_imu_package = imuMeasurements_
      .begin();
  okvis::ImuMeasurementDeque::iterator last_imu_package =
      imuMeasurements_.end();
  // TODO go backwards through queue. Is probably faster.
  for (auto iter = imuMeasurements_.begin(); iter != imuMeasurements_.end();
      ++iter) {
    // move first_imu_package iterator back until iter->timeStamp is higher than requested begintime
    if (iter->timeStamp <= imuDataBeginTime)
      first_imu_package = iter;

    // set last_imu_package iterator as soon as we hit first timeStamp higher than requested endtime & break
    if (iter->timeStamp >= imuDataEndTime) {
      last_imu_package = iter;
      // since we want to include this last imu measurement in returned Deque we
      // increase last_imu_package iterator once.
      ++last_imu_package;
      break;
    }
  }

  // create copy of imu buffer
  return okvis::ImuMeasurementDeque(first_imu_package, last_imu_package);
}

// Remove IMU measurements from the internal buffer.
int ThreadedKFVio::deleteImuMeasurements(const okvis::Time& eraseUntil) {
  std::lock_guard<std::mutex> lock(imuMeasurements_mutex_);
  if (imuMeasurements_.front().timeStamp > eraseUntil)
    return 0;

  okvis::ImuMeasurementDeque::iterator eraseEnd;
  int removed = 0;
  for (auto it = imuMeasurements_.begin(); it != imuMeasurements_.end(); ++it) {
    eraseEnd = it;
    if (it->timeStamp >= eraseUntil)
      break;
    ++removed;
  }

  imuMeasurements_.erase(imuMeasurements_.begin(), eraseEnd);

  return removed;
}


// Loop that visualizes completed frames.
void ThreadedKFVio::visualizationLoop() {
  okvis::VioVisualizer visualizer_(parameters_);
  for (;;) {
    VioVisualizer::VisualizationData::Ptr new_data;
    if (visualizationData_.PopBlocking(&new_data) == false)
      return;
    //visualizer_.showDebugImages(new_data);
    std::vector<cv::Mat> out_images(parameters_.nCameraSystem.numCameras());
    for (size_t i = 0; i < parameters_.nCameraSystem.numCameras(); ++i) {
      out_images[i] = visualizer_.drawMatches(new_data, i);
    }
	displayImages_.PushNonBlockingDroppingIfFull(out_images,1);
  }
}



// Propagates pose, speeds and biases with given IMU measurements.
bool ThreadedKFVio::propagation(const okvis::ImuMeasurementDeque & imuMeasurements,
                           const okvis::ImuParameters & imuParams,
                           okvis::kinematics::Transformation& T_WS_propagated,
                           okvis::SpeedAndBias & speedAndBiases,
                           const okvis::Time& t_start, const okvis::Time& t_end,
                           Eigen::Matrix<double, 15, 15>* covariance,
                           Eigen::Matrix<double, 15, 15>* jacobian) const {
  if (imuMeasurements.size() < 2) {
    LOG(WARNING)
        << "- Skipping propagation as only one IMU measurement has been given to frontend."
        << " Normal when starting up.";
    return 0;
  }
  int measurements_propagated = okvis::ceres::ImuError::propagation(
      imuMeasurements, imuParams, T_WS_propagated, speedAndBiases, t_start,
      t_end, covariance, jacobian);

  return measurements_propagated > 0;
}


// trigger display (needed because OSX won't allow threaded display)
void ThreadedKFVio::display() {
  std::vector<cv::Mat> out_images;
  if (displayImages_.Size() == 0)
	return;
  if (displayImages_.PopBlocking(&out_images) == false)
    return;
  // draw
  for (size_t im = 0; im < parameters_.nCameraSystem.numCameras(); im++) {
    std::stringstream windowname;
    windowname << "OKVIS camera " << im;
    cv::imshow(windowname.str(), out_images[im]);
  }
  cv::waitKey(1);
}





}  // namespace okvis
