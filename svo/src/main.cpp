
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <memory>
#include <functional>
#include <atomic>

#include <Eigen/Core>

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wnon-virtual-dtor"
#pragma GCC diagnostic ignored "-Woverloaded-virtual"
#include <opencv2/opencv.hpp>
#pragma GCC diagnostic pop
#include <okvis/VioParametersReader.hpp>
#include <okvis/ThreadedKFVio.hpp>
#include <okvis/pangolinViewer.hpp>
#include <boost/filesystem.hpp>
#include <boost/thread.hpp>
#include <svo/PangolinDSOViewer.h>

// this is just a workbench. most of the stuff here will go into the Frontend class.
int main(int argc, char **argv)
{
  google::InitGoogleLogging(argv[0]);
  FLAGS_stderrthreshold = 0;  // INFO: 0, WARNING: 1, ERROR: 2, FATAL: 3
  FLAGS_colorlogtostderr = 1;

  if (argc != 3 && argc != 4) {
    LOG(ERROR)<<
    "Usage: ./" << argv[0] << " configuration-yaml-file dataset-folder [skip-first-seconds]";
    return -1;
  }

  okvis::Duration deltaT(0.0);
  if (argc == 4) {
    deltaT = okvis::Duration(atof(argv[3]));
  }

  // read configuration file
  std::string configFilename(argv[1]);
  
  
  PangolinDSOViewer viewer(640,480);
  okvis::VioParametersReader vio_parameters_reader(configFilename);
  okvis::VioParameters parameters;
  vio_parameters_reader.getParameters(parameters);


  // the folder path
  std::string path(argv[2]);

  const unsigned int numCameras = parameters.nCameraSystem.numCameras();

  // open the IMU file
  std::string line;
  std::ifstream imu_file(path + "/imu0/data.csv");
  if (!imu_file.good()) {
    LOG(ERROR)<< "no imu file found at " << path+"/imu0/data.csv";
    return -1;
  }
  int number_of_lines = 0;
  while (std::getline(imu_file, line))
    ++number_of_lines;
  LOG(INFO)<< "No. IMU measurements: " << number_of_lines-1;
  if (number_of_lines - 1 <= 0) {
    LOG(ERROR)<< "no imu messages present in " << path+"/imu0/data.csv";
    return -1;
  }
  // set reading position to second line
  imu_file.clear();
  imu_file.seekg(0, std::ios::beg);
  std::getline(imu_file, line);

  std::vector<okvis::Time> times;
  okvis::Time latest(0);
  int num_camera_images = 0;
  std::vector < std::vector < std::string >> image_names(numCameras);
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
      LOG(ERROR)<< "no images at " << folder;
      return 1;
    }

    LOG(INFO)<< "No. cam " << i << " images: " << num_camera_images;
    // the filenames are not going to be sorted. So do this here
    std::sort(image_names.at(i).begin(), image_names.at(i).end());
  }

  std::vector < std::vector < std::string > ::iterator
      > cam_iterators(numCameras);
  for (size_t i = 0; i < numCameras; ++i) {
    cam_iterators.at(i) = image_names.at(i).begin();
  }

  int counter = 0;
  okvis::Time start(0.0);
  while (true) {
   
    // check if at the end
    for (size_t i = 0; i < numCameras; ++i) {
      if (cam_iterators[i] == image_names[i].end()) {
        std::cout << std::endl << "Finished. Press any key to exit." << std::endl << std::flush;
        cv::waitKey();
        return 0;
      }
    }

    /// add images
    okvis::Time t;

   
    cv::Mat filtered0 = cv::imread(
	path + "/cam" + std::to_string(0) + "/data/" + *cam_iterators.at(0),
	cv::IMREAD_GRAYSCALE);
    
    cv::Mat filtered1 = cv::imread(
      path + "/cam" + std::to_string(1) + "/data/" + *cam_iterators.at(1),
      cv::IMREAD_GRAYSCALE);
     
    
    // Assuming the images from diffrent cameras are synchronous
    std::string nanoseconds = cam_iterators.at(0)->substr(
	cam_iterators.at(0)->size() - 13, 9);
    std::string seconds = cam_iterators.at(0)->substr(
	0, cam_iterators.at(0)->size() - 13);
    t = okvis::Time(std::stoi(seconds), std::stoi(nanoseconds));
    if (start == okvis::Time(0.0)) {
      start = t;
    }
    
    

    // get all IMU measurements till then
    okvis::Time t_imu = start;
    do {
      if (!std::getline(imu_file, line)) {
	std::cout << std::endl << "Finished. Press any key to exit." << std::endl << std::flush;
	cv::waitKey();
	return 0;
      }

      std::stringstream stream(line);
      std::string s;
      std::getline(stream, s, ',');
      std::string nanoseconds = s.substr(s.size() - 9, 9);
      std::string seconds = s.substr(0, s.size() - 9);

      Eigen::Vector3d gyr;
      for (int j = 0; j < 3; ++j) {
	std::getline(stream, s, ',');
	gyr[j] = std::stof(s);
      }

      Eigen::Vector3d acc;
      for (int j = 0; j < 3; ++j) {
	std::getline(stream, s, ',');
	acc[j] = std::stof(s);
      }

      t_imu = okvis::Time(std::stoi(seconds), std::stoi(nanoseconds));
      
      // add the IMU measurement for (blocking) processing
      if (t_imu - start + okvis::Duration(1.0) > deltaT) {
	
	 std::cout<< "imu time "<<" "<< t<<std::endl;
      }

    } while (t_imu <= t);

    // add the image to the frontend for (blocking) processing
    if (t - start > deltaT) {
     // okvis_estimator.addImage(t, i, filtered);
    // okvis_estimator.addImage(t, i, filtered);
      
      std::cout<< "image time "<<" "<< t<<std::endl;
    }

    cam_iterators[0]++;
    cam_iterators[1]++;
    
    ++counter;

    // display progress
    if (counter % 20 == 0) {
      std::cout << "\rProgress: "
          << int(double(counter) / double(num_camera_images) * 100) << "%  "
          << std::flush;
    }

  }

  std::cout << std::endl << std::flush;
  return 0;
}

