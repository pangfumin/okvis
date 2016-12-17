/**
* This file is part of DSO.
* 
* Copyright 2016 Technical University of Munich and Intel.
* Developed by Jakob Engel <engelj at in dot tum dot de>,
* for more information see <http://vision.in.tum.de/dso>.
* If you use this code, please cite the respective publications as
* listed on the above website.
*
* DSO is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* DSO is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with DSO. If not, see <http://www.gnu.org/licenses/>.
*/


#pragma once
#include <pangolin/pangolin.h>
#include "boost/thread.hpp"

#include <map>
#include <deque>


class PangolinDSOViewer 
{
public:
	PangolinDSOViewer(int w, int h);
	~PangolinDSOViewer();

	void run();
	void close();

	//void addImageToDisplay(std::string name, MinimalImageB3* image);
	//void clearAllImagesToDisplay();


	// ==================== Output3DWrapper Functionality ======================
	/*
	 void publishGraph(const std::map<long,Eigen::Vector2i> &connectivity);
	 void publishKeyframes(
			std::vector<FrameHessian*> &frames,
			bool final,
			CalibHessian* HCalib);
	 void publishCamPose(FrameShell* frame,
			CalibHessian* HCalib);



	 void pushLiveFrame(FrameHessian* image);
	 void pushDepthImage(MinimalImageB3* image);
	 */


	 void join();

	 void reset();
private:

	bool needReset;
	//void reset_internal();
	//void drawConstraints();

	boost::thread runThread;
	bool running;
	int w,h;



	// images rendering
	boost::mutex openImagesMutex;
	//MinimalImageB3* internalVideoImg;
	//MinimalImageB3* internalKFImg;
	//MinimalImageB3* internalResImg;
	bool videoImgChanged, kfImgChanged, resImgChanged;



	// 3D model rendering
	boost::mutex model3DMutex;
	/*
	std::vector<KeyFrameDisplay*> keyframes;
	std::vector<Vec3f> allFramePoses;
	std::map<int, KeyFrameDisplay*> keyframesByKFID;
	std::vector<GraphConnection> connections;
	*/



	// render settings
	bool settings_showKFCameras;
	bool settings_showCurrentCamera;
	bool settings_showTrajectory;
	bool settings_showFullTrajectory;
	bool settings_showActiveConstraints;
	bool settings_showAllConstraints;

	float settings_scaledVarTH;
	float settings_absVarTH;
	int settings_pointCloudMode;
	float settings_minRelBS;
	int settings_sparsity;


	// timings
	struct timeval last_track;
	struct timeval last_map;


	std::deque<float> lastNTrackingMs;
	std::deque<float> lastNMappingMs;
};


