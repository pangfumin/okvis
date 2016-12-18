#ifndef INCLUDE_OKVIS_THREADEDKFVIO_HPP_
#define INCLUDE_OKVIS_THREADEDKFVIO_HPP_

#include <thread>
#include <mutex>
#include <condition_variable>
#include <atomic>

#include <okvis/cameras/NCameraSystem.hpp>
#include <okvis/Measurements.hpp>

#include <okvis/MultiFrame.hpp>
#include <okvis/Parameters.hpp>
#include <okvis/assert_macros.hpp>

#include <okvis/ImuFrameSynchronizer.hpp>
#include <okvis/FrameSynchronizer.hpp>
#include <okvis/VioVisualizer.hpp>
#include <okvis/timing/Timer.hpp>
#include <okvis/threadsafe/ThreadsafeQueue.hpp>

#include <okvis/pangolinViewer.hpp>

#include <okvis/Estimator.hpp>
#include <okvis/VioFrontendInterface.hpp>

#include <vikit/abstract_camera.h>
#include <svo/frame_handler_base.h>
#include <svo/reprojector.h>
#include <svo/initialization.h>



/// \brief okvis Main namespace of this package.
namespace okvis {

/**
 *  \brief
 *  This class manages the complete data flow in and out of the algorithm, as well as
 *  between the processing threads.
 *
 *  To ensure fast return from user callbacks, new data are collected in thread save
 *  input queues and are processed in data consumer threads, one for each data source.
 *  The algorithm tasks are running in individual threads with thread save queue for
 *  message passing.
 *  For sending back data to the user, publisher threads are created for each output
 *  which ensure that the algorithm is not being blocked by slow users.
 *
 *  All the queues can be limited to size 1 to back propagate processing congestions
 *  to the user callback.
 */

class pangolinViewer;
class ThreadedKFVio  : public svo::FrameHandlerBase{
 public:

  EIGEN_MAKE_ALIGNED_OPERATOR_NEW
  OKVIS_DEFINE_EXCEPTION(Exception, std::runtime_error)

#ifdef DEACTIVATE_TIMERS
  typedef okvis::timing::DummyTimer TimerSwitchable;
#else
  typedef okvis::timing::Timer TimerSwitchable;
#endif


  /**
   * \brief Constructor.
   * \param parameters Parameters and settings.
   */
 
  ThreadedKFVio(okvis::VioParameters& parameters,vk::AbstractCamera* cam);


  /// \brief Destructor. This calls Shutdown() for all threadsafe queues and joins all threads.
  virtual ~ThreadedKFVio();

 
  bool addStereo(const okvis::Time & stamp, 
                        const cv::Mat & image0, const cv::Mat & image1);

  
  /**
   * \brief          Add an IMU measurement.
   * \param stamp    The measurement timestamp.
   * \param alpha    The acceleration measured at this time.
   * \param omega    The angular velocity measured at this time.
   * \return Returns true normally. False if the previous one has not been processed yet.
   */
  bool addImuMeasurement(const okvis::Time & stamp,
                                 const Eigen::Vector3d & alpha,
                                 const Eigen::Vector3d & omega);

  
  /// \}
  /// \name Setters
  /// \{
  /**
   * \brief Set the blocking variable that indicates whether the addMeasurement() functions
   *        should return immediately (blocking=false), or only when the processing is complete.
   */
  void setBlocking(bool blocking);
   /// \}
  
  void setPangolinViewer(okvis::pangolinViewer* viewer)
  {
    viewer_ = viewer;      
  }
 
   
  /// \brief Trigger display (needed because OSX won't allow threaded display).
  void display();
  
  
  // Propagates pose, speeds and biases with given IMU measurements.
  bool propagation(const okvis::ImuMeasurementDeque & imuMeasurements,
			    const okvis::ImuParameters & imuParams,
			    okvis::kinematics::Transformation& T_WS_propagated,
			    okvis::SpeedAndBias & speedAndBiases,
			    const okvis::Time& t_start, const okvis::Time& t_end,
			    Eigen::Matrix<double, 15, 15>* covariance,
			    Eigen::Matrix<double, 15, 15>* jacobian) const ;
			    
			    

  
 private:
   
   bool blocking_;
  /// \brief Start all threads.
  void startThreads();
  /// \brief Initialises settings and calls startThreads().
  void init();

 private:
   
  vk::AbstractCamera* cam_;                     //!< Camera model, can be ATAN, Pinhole or Ocam (see vikit).
  svo::Reprojector reprojector_;                     //!< Projects points from other keyframes into the current frame
  svo::FramePtr new_frame_;                          //!< Current frame.
  svo::FramePtr last_frame_;                         //!< Last frame, not necessarily a keyframe.
  std::set<svo::FramePtr> core_kfs_;                      //!< Keyframes in the closer neighbourhood.
  std::vector< std::pair<svo::FramePtr,size_t> > overlap_kfs_; //!< All keyframes with overlapping field of view. the paired number specifies how many common mappoints are observed TODO: why vector!?
  
  svo::DepthFilter* depth_filter_;                   //!< Depth estimation algorithm runs in a parallel thread and is used to initialize new 3D points.

  
  okvis::pangolinViewer* viewer_;
  // Loop to process frames from camera with index cameraIndex
  void stereoConsumerLoop();
  
  
  /// \brief Loop to process IMU measurements.
  void imuConsumerLoop();
  
 
  /// \brief Loop that visualizes completed frames.
  void visualizationLoop();
  /// \brief Loop that performs the optimization and marginalisation.
  void optimizationLoop();
  /// \brief Loop that publishes the newest state and landmarks.
  void publisherLoop();

  /**
   * @brief Get a subset of the recorded IMU measurements.
   * @param start The first IMU measurement in the return value will be older than this timestamp.
   * @param end The last IMU measurement in the return value will be newer than this timestamp.
   * @remark This function is threadsafe.
   * @return The IMU Measurement spanning at least the time between start and end.
   */
  okvis::ImuMeasurementDeque getImuMeasurments(okvis::Time& start,
                                               okvis::Time& end);

  /**
   * @brief Remove IMU measurements from the internal buffer.
   * @param eraseUntil Remove all measurements that are strictly older than this time.
   * @return The number of IMU measurements that have been removed
   */
  int deleteImuMeasurements(const okvis::Time& eraseUntil);

 private:

  /// @brief This struct contains the results of the optimization for ease of publication.
  ///        It is also used for publishing poses that have been propagated with the IMU
  ///        measurements.
  struct OptimizationResults {
		EIGEN_MAKE_ALIGNED_OPERATOR_NEW
    okvis::Time stamp;                          ///< Timestamp of the optimized/propagated pose.
    okvis::kinematics::Transformation T_WS;     ///< The pose.
    okvis::SpeedAndBias speedAndBiases;         ///< The speeds and biases.
    Eigen::Matrix<double, 3, 1> omega_S;        ///< The rotational speed of the sensor.
    /// The relative transformation of the cameras to the sensor (IMU) frame
    std::vector<okvis::kinematics::Transformation,
        Eigen::aligned_allocator<okvis::kinematics::Transformation> > vector_of_T_SCi;
    okvis::MapPointVector landmarksVector;      ///< Vector containing the current landmarks.
    okvis::MapPointVector transferredLandmarks; ///< Vector of the landmarks that have been marginalized out.
    bool onlyPublishLandmarks;                  ///< Boolean to signalise the publisherLoop() that only the landmarks should be published
  };

  /// @name State variables
  /// @{

  okvis::SpeedAndBias speedAndBiases_propagated_;     ///< The speeds and IMU biases propagated by the IMU measurements.
  /// \brief The IMU parameters.
  /// \warning Duplicate of parameters_.imu
  okvis::ImuParameters imu_params_;
  okvis::kinematics::Transformation T_WS_propagated_; ///< The pose propagated by the IMU measurements
 

  // lock lastState_mutex_ when accessing these
  /// \brief Resulting pose of the last optimization
  /// \warning Lock lastState_mutex_.
  okvis::kinematics::Transformation lastOptimized_T_WS_;
  /// \brief Resulting speeds and IMU biases after last optimization.
  /// \warning Lock lastState_mutex_.
  okvis::SpeedAndBias lastOptimizedSpeedAndBiases_;
  /// \brief Timestamp of newest frame used in the last optimization.
  /// \warning Lock lastState_mutex_.
  okvis::Time lastOptimizedStateTimestamp_;
  /// This is set to true after optimization to signal the IMU consumer loop to repropagate
  /// the state from the lastOptimizedStateTimestamp_.
  std::atomic_bool repropagationNeeded_;
  
  

  /// @}

  ImuFrameSynchronizer imuFrameSynchronizer_;  ///< The IMU frame synchronizer.
  /// \brief The frame synchronizer responsible for merging frames into multiframes
  /// \warning Lock with frameSynchronizer_mutex_
  okvis::FrameSynchronizer frameSynchronizer_;

  okvis::Time lastAddedStateTimestamp_; ///< Timestamp of the newest state in the Estimator.
  okvis::Time lastAddedImageTimestamp_; ///< Timestamp of the newest image added to the image input queue.


  /// @name Measurement input queues
  /// @{


  std::shared_ptr<
      okvis::threadsafe::ThreadSafeQueue<std::shared_ptr<okvis::StereoMeasurement> > >  StereoMeasurementsReceived_;
  /// IMU measurement input queue.
  okvis::threadsafe::ThreadSafeQueue<okvis::ImuMeasurement> imuMeasurementsReceived_;

  

  /// @}
  /// @name Measurement operation queues.
  /// @{

  
  /// \brief The IMU measurements.
  /// \warning Lock with imuMeasurements_mutex_.
  okvis::ImuMeasurementDeque imuMeasurements_;
  
  /// The queue containing the results of the optimization or IMU propagation ready for publishing.
  okvis::threadsafe::ThreadSafeQueue<OptimizationResults> optimizationResults_;
  /// The queue containing visualization data that is ready to be displayed.
  okvis::threadsafe::ThreadSafeQueue<VioVisualizer::VisualizationData::Ptr> visualizationData_;
  /// The queue containing the actual display images
  okvis::threadsafe::ThreadSafeQueue<std::vector<cv::Mat>> displayImages_;

  /// @}
  /// @name Mutexes
  /// @{

  std::mutex imuMeasurements_mutex_;      ///< Lock when accessing imuMeasurements_
 
  std::mutex frameSynchronizer_mutex_;    ///< Lock when accessing the frameSynchronizer_.
  std::mutex estimator_mutex_;            ///< Lock when accessing the estimator_.
  ///< Condition variable to signalise that optimization is done.
  std::condition_variable optimizationNotification_;
  /// Boolean flag for whether optimization is done for the last state that has been added to the estimator.
  std::atomic_bool optimizationDone_;
  std::mutex lastState_mutex_;            ///< Lock when accessing any of the 'lastOptimized*' variables.

  /// @}
  /// @name Consumer threads
  /// @}

  /// Threads running the frameConsumerLoop(). One per camera.
 
  std::thread stereoConsumerThread_;
  std::thread imuConsumerThread_;           ///< Thread running imuConsumerLoop().
  
  std::thread visualizationThread_;
 
 
  /// @}
  /// @name Algorithm objects.
  /// @{


  okvis::Estimator estimator_;    ///< The backend estimator.
  //okvis::Frontend frontend_;      ///< The frontend.


  /// @}

  size_t numCameras_;     ///< Number of cameras in the system.
  size_t numCameraPairs_; ///< Number of camera pairs in the system.

  okvis::VioParameters parameters_; ///< The parameters and settings.

  /// The maximum input queue size before IMU measurements are dropped.
  /// The maximum input queue size for the camera measurements is proportionally higher
  /// depending on the ratio between IMU and camera rate.
  const size_t maxImuInputQueueSize_;

  /// Max position measurements before dropping.
  const size_t maxPositionInputQueueSize_ = 10;
  
};

}  // namespace okvis

#endif /* INCLUDE_OKVIS_THREADEDKFVIO_HPP_ */
