/**
* This file is part of ORB-SLAM2.
*
* Copyright (C) 2014-2016 Raúl Mur-Artal <raulmur at unizar dot es> (University of Zaragoza)
* For more information see <https://github.com/raulmur/ORB_SLAM2>
*
* ORB-SLAM2 is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* ORB-SLAM2 is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with ORB-SLAM2. If not, see <http://www.gnu.org/licenses/>.
*/

#include "okvis/pangolinViewer.hpp"

#include <iostream>
//#include <mutex>

namespace okvis
{
  
  

pangolinViewer::pangolinViewer():
   
    mbFinishRequested(false), mbFinished(true), mbStopped(false), mbStopRequested(false),newPoseAriving_(false)
{
   
    mT = 1e3/20.0;

    mImageWidth = 752;
    mImageHeight = 480;
    if(mImageWidth<1 || mImageHeight<1)
    {
        mImageWidth = 640;
        mImageHeight = 480;
    }

    mViewpointX = 0;
    mViewpointY = -0.7;
    mViewpointZ = -1.8;
    mViewpointF = 500;
    
    /*
    Viewer.KeyFrameSize: 0.05
Viewer.KeyFrameLineWidth: 1
Viewer.GraphLineWidth: 0.9
Viewer.PointSize:2
Viewer.CameraSize: 0.08
Viewer.CameraLineWidth: 3
Viewer.ViewpointX: 0
Viewer.ViewpointY: -0.7
Viewer.ViewpointZ: -1.8
Viewer.ViewpointF: 500
*/
    mKeyFrameSize = 0.05;
    mKeyFrameLineWidth = 1;
    mGraphLineWidth = 0.9;
    mPointSize = 2;
    mCameraSize = 0.08;
    mCameraLineWidth = 3;

    
    
   
    
    
   
}

void pangolinViewer::Run()
{
  
    mbFinished = false;

    pangolin::CreateWindowAndBind("okvis: Map Viewer",1024,768);

    // 3D Mouse handler requires depth testing to be enabled
    glEnable(GL_DEPTH_TEST);

    // Issue specific OpenGl we might need
    glEnable (GL_BLEND);
    glBlendFunc (GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    pangolin::CreatePanel("menu").SetBounds(0.0,1.0,0.0,pangolin::Attach::Pix(175));
    pangolin::Var<bool> menuFollowCamera("menu.Follow Camera",false,true);
    pangolin::Var<bool> menuShowPoints("menu.Show Points",true,true);
    pangolin::Var<bool> menuShowKeyFrames("menu.Show KeyFrames",true,true);
    pangolin::Var<bool> menuShowGraph("menu.Show Graph",true,true);
    pangolin::Var<bool> menuLocalizationMode("menu.Localization Mode",false,true);
    pangolin::Var<bool> menuReset("menu.Reset",false,false);

    // Define Camera Render Object (for view / scene browsing)
    pangolin::OpenGlRenderState s_cam(
                pangolin::ProjectionMatrix(1024,768,mViewpointF,mViewpointF,512,389,0.1,1000),
                pangolin::ModelViewLookAt(mViewpointX,mViewpointY,mViewpointZ, 0,0,0,0.0,-1.0, 0.0)
                );

    // Add named OpenGL viewport to window and provide 3D Handler
    pangolin::View& d_cam = pangolin::CreateDisplay()
            .SetBounds(0.0, 1.0, pangolin::Attach::Pix(175), 1.0, -1024.0f/768.0f)
            .SetHandler(new pangolin::Handler3D(s_cam));

   
   

   

    bool bFollow = false;
    bool bLocalizationMode = false;

    while(1)
    {
      
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	GetCurrentOpenGLCameraMatrix(Twc_);

        if(menuFollowCamera && bFollow)
        {
            s_cam.Follow(Twc_);
        }
        else if(menuFollowCamera && !bFollow)
        {
            s_cam.SetModelViewMatrix(pangolin::ModelViewLookAt(mViewpointX,mViewpointY,mViewpointZ, 0,0,0,0.0,-1.0, 0.0));
            s_cam.Follow(Twc_);
            bFollow = true;
        }
        else if(!menuFollowCamera && bFollow)
        {
            bFollow = false;
        }

        
       

        d_cam.Activate(s_cam);
        
        glClearColor(1.0f,1.0f,1.0f,1.0f);
        DrawCurrentCamera(Twc_);
        pangolin::FinishFrame();
	
	
        

        if(menuReset)
        {
            menuShowGraph = true;
            menuShowKeyFrames = true;
            menuShowPoints = true;
            menuLocalizationMode = false;
            if(bLocalizationMode)
                //mpSystem->DeactivateLocalizationMode();
            bLocalizationMode = false;
            bFollow = true;
            menuFollowCamera = false;
           // mpSystem->Reset();
            menuReset = false;
	    
	   // std::cout<<"reset"<<std::endl;
        }

        if(Stop())
        {
            while(isStopped())
            {
                usleep(3000);
            }
        }

        if(CheckFinish())
            break;
	
	
	
      
        usleep(3000);
    }

    SetFinish();
    
}

void pangolinViewer::setShowInfo( const okvis::Time & t, const okvis::kinematics::Transformation & T_WS,
      const Eigen::Matrix<double, 9, 1> & speedAndBiases,
      const Eigen::Matrix<double, 3, 1> & /*omega_S*/)
{
  
   boost::mutex::scoped_lock lock(mGetInfo);
   t_ = t; 
   T_WS_ = T_WS;
   speedAndBiases_ = speedAndBiases;
   //std::cout<<"showinfo set"<<std::endl;
  
 
}


void pangolinViewer::GetCurrentOpenGLCameraMatrix(pangolin::OpenGlMatrix &M)
{
        Eigen::Matrix3d Rwc;
        Eigen::Vector3d twc;
        {
            boost::mutex::scoped_lock lock(mGetInfo);
            Rwc = T_WS_.C();
            twc = T_WS_.r();
        }
       std::cout<<twc(0) <<" "<< twc(1)<<" "<<twc(2)<<std::endl;

        M.m[0] = Rwc(0,0);
        M.m[1] = Rwc(1,0);
        M.m[2] = Rwc(2,0);
        M.m[3]  = 0.0;

        M.m[4] = Rwc(0,1);
        M.m[5] = Rwc(1,1);
        M.m[6] = Rwc(2,1);
        M.m[7]  = 0.0;

        M.m[8] = Rwc(0,2);
        M.m[9] = Rwc(1,2);
        M.m[10] = Rwc(2,2);
        M.m[11]  = 0.0;

        M.m[12] = twc(0);
        M.m[13] = twc(1);
        M.m[14] = twc(2);
        M.m[15]  = 1.0;
    
 
}



void pangolinViewer::DrawCurrentCamera(pangolin::OpenGlMatrix &Twc)
{
    const float &w = mCameraSize;
    const float h = w*0.75;
    const float z = w*0.6;

    glPushMatrix();

#ifdef HAVE_GLES
        glMultMatrixf(Twc.m);
#else
        glMultMatrixd(Twc.m);
#endif
	std::cout<< Twc.m[12]<<std::endl;

    glLineWidth(mCameraLineWidth);
    glColor3f(0.0f,1.0f,0.0f);
    glBegin(GL_LINES);
    glVertex3f(0,0,0);
    glVertex3f(w,h,z);
    glVertex3f(0,0,0);
    glVertex3f(w,-h,z);
    glVertex3f(0,0,0);
    glVertex3f(-w,-h,z);
    glVertex3f(0,0,0);
    glVertex3f(-w,h,z);

    glVertex3f(w,h,z);
    glVertex3f(w,-h,z);

    glVertex3f(-w,h,z);
    glVertex3f(-w,-h,z);

    glVertex3f(-w,h,z);
    glVertex3f(w,h,z);

    glVertex3f(-w,-h,z);
    glVertex3f(w,-h,z);
    glEnd();

    glPopMatrix();
    
   // std::cout<<"show pose"<<std::endl;
}



 

void pangolinViewer::RequestFinish()
{
    boost::mutex::scoped_lock lock(mMutexFinish);
    mbFinishRequested = true;
}

bool pangolinViewer::CheckFinish()
{
     boost::mutex::scoped_lock  lock(mMutexFinish);
    return mbFinishRequested;
}

void pangolinViewer::SetFinish()
{
     boost::mutex::scoped_lock lock(mMutexFinish);
    mbFinished = true;
}

bool pangolinViewer::isFinished()
{
     boost::mutex::scoped_lock  lock(mMutexFinish);
    
    return mbFinished;
}

void pangolinViewer::RequestStop()
{
     boost::mutex::scoped_lock  lock(mMutexStop);
    if(!mbStopped)
        mbStopRequested = true;
}

bool pangolinViewer::isStopped()
{
     boost::mutex::scoped_lock  lock(mMutexStop);
    return mbStopped;
}

bool pangolinViewer::Stop()
{
     boost::mutex::scoped_lock  lock(mMutexStop);
    boost::mutex::scoped_lock lock2(mMutexFinish);

    if(mbFinishRequested)
        return false;
    else if(mbStopRequested)
    {
        mbStopped = true;
        mbStopRequested = false;
        return true;
    }

    return false;

}

void pangolinViewer::Release()
{
     boost::mutex::scoped_lock  lock(mMutexStop);
    mbStopped = false;
}

}
