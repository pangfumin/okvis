
#ifndef _CONVERT_H_
#define _CONVERT_H_

#include <vikit/math_utils.h>
#include <vikit/vision.h>
#include <vikit/abstract_camera.h>
#include <vikit/atan_camera.h>
#include <vikit/pinhole_camera.h>
#include <okvis/VioParametersReader.hpp>

#include <iostream>
#include <memory>

//vk::AbstractCamera* cam =  new vk::PinholeCamera();
namespace Convert{
/*
std::shared_ptr<vk::PinholeCamera> makePinholeCamera_Ptr(okvis::CameraCalibration cali)
{
    
  std::shared_ptr<vk::PinholeCamera> cam  = std::make_shared<vk::PinholeCamera>(
              new vk::PinholeCamera(cali.imageDimension[0], cali.imageDimension[1], 
				cali.focalLength[0], cali.focalLength[1], 
				cali.principalPoint[0], cali.principalPoint[1],
				 cali.distortionCoefficients[0],
				 cali.distortionCoefficients[1],
				 cali.distortionCoefficients[2],
				 cali.distortionCoefficients[3]));
  return cam;
}

vk::AbstractCamera* makePinholeCamera(okvis::CameraCalibration cali)
{
    
  return new (vk::PinholeCamera(cali.imageDimension[0], cali.imageDimension[1], 
				cali.focalLength[0], cali.focalLength[1], 
				cali.principalPoint[0], cali.principalPoint[1],
				 cali.distortionCoefficients[0],
				 cali.distortionCoefficients[1],
				 cali.distortionCoefficients[2],
				 cali.distortionCoefficients[3])));
  return cam;
}
*/


}

#endif