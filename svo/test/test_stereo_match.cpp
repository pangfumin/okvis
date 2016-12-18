#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <memory>
#include <functional>
#include <atomic>

#include <Eigen/Core>

#include <svo/global.h>
#include <svo/config.h>
#include <svo/frame.h>
#include <svo/feature_detection.h>
#include <svo/depth_filter.h>
#include <svo/feature.h>
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wnon-virtual-dtor"
#pragma GCC diagnostic ignored "-Woverloaded-virtual"
#include <opencv2/opencv.hpp>
#pragma GCC diagnostic pop
#include <okvis/VioParametersReader.hpp>
#include "test_utils.h"
#include <svo/convert.h>
#include <vikit/abstract_camera.h>
#include <vikit/pinhole_camera.h>


int main(int argc, char **argv)
{

  // read configuration file
  std::string configFilename("/home/pang/software/okvis/config/config_fpga_p2_euroc.yaml");
  // the folder path
  std::string path("/home/pang/dataset/mav_cam_imu/MH_01_easy/mav0/");
  
  
  okvis::VioParametersReader vio_parameters_reader(configFilename);
  okvis::VioParameters parameters;
  std::vector<okvis::CameraCalibration,Eigen::aligned_allocator<okvis::CameraCalibration>> calibrations;
  vio_parameters_reader.getParameters(parameters);
  vio_parameters_reader.getCameraCalibration(calibrations);
  
   okvis::CameraCalibration cali = calibrations.at(0);
   /*
  std::cout<<cali0.imageDimension<<std::endl;
  std::cout<<cali0.focalLength<<std::endl;
  std::cout<<cali0.principalPoint<<std::endl;
  std::cout<<cali0.distortionType<<std::endl;
  std::cout<<cali0.distortionCoefficients<<std::endl;
  */
  
  /*
  std::shared_ptr<vk::PinholeCamera> cam  = std::make_shared<vk::PinholeCamera>(
                         vk::PinholeCamera(752, 480, 315.5, 315.5, 376.0, 240.0));
                         */

  vk::AbstractCamera* cam =  new vk::PinholeCamera(cali.imageDimension[0], cali.imageDimension[1], 
				cali.focalLength[0], cali.focalLength[1], 
				cali.principalPoint[0], cali.principalPoint[1],
				 cali.distortionCoefficients[0],
				 cali.distortionCoefficients[1],
				 cali.distortionCoefficients[2],
				 cali.distortionCoefficients[3]);
				 
  //vk::AbstractCamera* cam  = new vk::PinholeCamera(752, 480, 315.5, 315.5, 376.0, 240.0);
 
  const unsigned int numCameras = parameters.nCameraSystem.numCameras();
  
  //cv::namedWindow("image");
  
  std::vector < std::vector < std::string >> image_names(2);
  int num_images = svo::test_utils::getImageNameList( path,image_names);
  std::cout<< "total: " <<num_images<<std::endl;
  cv::Mat image0,image1;
  
  if (svo::test_utils::getNthStereoImages(1,path,image_names,image0,image1))
  {
    std::cout<<"Read images :"<<image0.rows<< " "<<image0.cols<<std::endl;
    
     svo::FramePtr frame(new svo::Frame(cam, image0, 0.0));

      // Corner detection
      vk::Timer t;
      svo::Features fts;
      svo::feature_detection::FastDetector fast_detector(
	  image0.cols, image0.rows, svo::Config::gridSize(), svo::Config::nPyrLevels());
      for(int i=0; i<100; ++i)
      {
	fast_detector.detect(frame.get(), frame->img_pyr_, svo::Config::triangMinCornerScore(), fts);
      }
      printf("Fast corner detection took %f ms, %zu corners detected (ref i7-W520: 7.166360ms, 40000)\n", t.stop()*10, fts.size());
      printf("Note, in this case, feature detection also contains the cam2world projection of the feature.\n");
      cv::Mat img_rgb = cv::Mat(image0.size(), CV_8UC3);
      cv::cvtColor(image0, img_rgb, CV_GRAY2RGB);
      std::for_each(fts.begin(), fts.end(), [&](svo::Feature* i){
	cv::circle(img_rgb, cv::Point2f(i->px[0], i->px[1]), 4*(i->level+1), cv::Scalar(0,255,0), 1);
      });
      cv::imshow("ref_img", img_rgb);
      cv::waitKey(0);

      std::for_each(fts.begin(), fts.end(), [&](svo::Feature* i){ delete i; });
  
  
  }
  
 
  return 0;
}
