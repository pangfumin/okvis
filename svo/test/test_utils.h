
#ifndef TEST_UTILS_H_
#define TEST_UTILS_H_

#include <string.h>
#include <cstdlib> // for getenv
#ifdef SVO_USE_ROS
# include <ros/package.h>
# include <vikit/params_helper.h>
#endif
#include <boost/filesystem.hpp>
#include <opencv2/opencv.hpp>


namespace svo {
namespace test_utils {

std::string getDatasetDir()
{
  const char* env_dir = std::getenv("SVO_DATASET_DIR");
#ifdef SVO_USE_ROS
  std::string dataset_dir(ros::package::getPath("svo")+"/test/data");
  if(env_dir != NULL)
    dataset_dir = std::string(env_dir);
  return dataset_dir;
#else
  return std::string(env_dir);
#endif
}

std::string getTraceDir()
{
#ifdef SVO_USE_ROS
  std::string default_dir(ros::package::getPath("svo")+"/test/results");
  return vk::getParam<std::string>("svo/trace_dir", default_dir);
#else
  return "/tmp";
#endif
}


int getImageNameList(std::string path,std::vector < std::vector < std::string >> &image_names)
{
  int num_camera_images = 0;
  size_t numCameras = 2;
 
  for (size_t i = 0; i < numCameras; ++i) {
    num_camera_images = 0;
    std::string folder(path + "/cam" + std::to_string(i) + "/data");

    for (auto it = boost::filesystem::directory_iterator(folder);
        it != boost::filesystem::directory_iterator(); it++) {
      if (!boost::filesystem::is_directory(it->path())) {  //we eliminate directories
        num_camera_images++;
        image_names.at(i).push_back(it->path().filename().string());
      } else {
        continue;
      }
    }

    if (num_camera_images == 0) {   
      return 1;
    }

   
    std::sort(image_names.at(i).begin(), image_names.at(i).end());
  }
  return num_camera_images;
}


bool getNthStereoImages(unsigned int nth,std::string path,
			std::vector < std::vector < std::string >> &image_names,
			cv::Mat &image0, cv::Mat &image1 )
{
  
  if (nth > image_names.at(0).size())
    return false;
   image0 = cv::imread(
	path + "/cam" + std::to_string(0) + "/data/" + image_names.at(0).at(nth),
	cv::IMREAD_GRAYSCALE);
    
   image1 = cv::imread(
      path + "/cam" + std::to_string(1) + "/data/" + image_names.at(1).at(nth),
      cv::IMREAD_GRAYSCALE);
     
   return true;
}
			
  
} // namespace test_utils
} // namespace svo


#endif // TEST_UTILS_H_
