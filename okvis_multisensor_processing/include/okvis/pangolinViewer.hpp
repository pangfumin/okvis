


#ifndef VIEWER_H
#define VIEWER_H


#include <Eigen/Core>
#include <pangolin/pangolin.h>
#include "okvis/ThreadedKFVio.hpp"
#include <boost/thread.hpp>
namespace okvis
{


class pangolinViewer
{
public:
    pangolinViewer();
   
    // Main thread function. Draw points, keyframes, the current camera pose and the last processed
    // frame. Drawing is refreshed according to the camera fps. We use Pangolin.
    void Run();

    void RequestFinish();

    void RequestStop();

    bool isFinished();

    bool isStopped();

    void Release();
    
    void setShowInfo( const okvis::Time & t, const okvis::kinematics::Transformation & T_WS,
      const Eigen::Matrix<double, 9, 1> & speedAndBiases,
      const Eigen::Matrix<double, 3, 1> & /*omega_S*/);
    
    

private:

    bool Stop();
    void GetCurrentOpenGLCameraMatrix(pangolin::OpenGlMatrix &M);
    void DrawCurrentCamera(pangolin::OpenGlMatrix &Twc);

    // 1/fps in ms
    double mT;
    float mImageWidth, mImageHeight;

    float mViewpointX, mViewpointY, mViewpointZ, mViewpointF;

    bool CheckFinish();
    void SetFinish();
    bool mbFinishRequested;
    bool mbFinished;
    boost::mutex mMutexFinish;

    bool mbStopped;
    bool mbStopRequested;
    boost::mutex mMutexStop;
    boost::mutex mGetInfo;
    
    
    float mKeyFrameSize;
    float mKeyFrameLineWidth;
    float mGraphLineWidth;
    float mPointSize;
    float mCameraSize;
    float mCameraLineWidth;
    
    
    pangolin::OpenGlMatrix Twc_;
    Time  t_; 
    kinematics::Transformation  T_WS_;
    
    Eigen::Matrix<double, 9, 1>  speedAndBiases_;
    Eigen::Matrix<double, 3, 1>  omega_S_;
      
};

}


#endif // VIEWER_H
	

