// This file is part of SVO - Semi-direct Visual Odometry.
//
// Copyright (C) 2014 Christian Forster <forster at ifi dot uzh dot ch>
// (Robotics and Perception Group, University of Zurich, Switzerland).
//
// SVO is free software: you can redistribute it and/or modify it under the
// terms of the GNU General Public License as published by the Free Software
// Foundation, either version 3 of the License, or any later version.
//
// SVO is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include <stdexcept>
#include <vikit/math_utils.h>
#include <svo/point.h>
#include <svo/frame.h>
#include <svo/feature.h>
 
namespace svo {

int Point::point_counter_ = 0;

Point::Point(const Vector3d& pos) :
  id_(point_counter_++),
  pos_(pos),
  normal_set_(false),
  n_obs_(0),
  v_pt_(NULL),
  last_published_ts_(0),
  last_projected_kf_id_(-1),
  type_(TYPE_UNKNOWN),
  n_failed_reproj_(0),
  n_succeeded_reproj_(0),
  last_structure_optim_(0)
{}

Point::Point(const Vector3d& pos, Feature* ftr) :
  id_(point_counter_++),
  pos_(pos),
  normal_set_(false),
  n_obs_(1),
  v_pt_(NULL),
  last_published_ts_(0),
  last_projected_kf_id_(-1),
  type_(TYPE_UNKNOWN),
  n_failed_reproj_(0),
  n_succeeded_reproj_(0),
  last_structure_optim_(0)
{
  obs_.push_front(ftr);
}

Point::~Point()
{}

void Point::addFrameRef(Feature* ftr)
{
  obs_.push_front(ftr);
  ++n_obs_;
}

Feature* Point::findFrameRef(Frame* frame)
{
  for(auto it=obs_.begin(), ite=obs_.end(); it!=ite; ++it)
    if((*it)->frame == frame)
      return *it;
  return NULL;    // no keyframe found
}

// 从这个点的众多obs中擦出指定的frame
bool Point::deleteFrameRef(Frame* frame)
{
  for(auto it=obs_.begin(), ite=obs_.end(); it!=ite; ++it)
  {
    if((*it)->frame == frame)
    {
      obs_.erase(it);
      return true;
    }
  }
  return false;
}

void Point::initNormal()
{
  assert(!obs_.empty());
  const Feature* ftr = obs_.back();
  assert(ftr->frame != NULL);
  normal_ = ftr->frame->T_f_w_.rotation_matrix().transpose()*(-ftr->f);
  normal_information_ = DiagonalMatrix<double,3,3>(pow(20/(pos_-ftr->frame->pos()).norm(),2), 1.0, 1.0);
  normal_set_ = true;
}

bool Point::getCloseViewObs(const Vector3d& framepos, Feature*& ftr) const
{
  // TODO: get frame with same point of view AND same pyramid level!
  // obs_dir: 从当前帧摄像机光心指向3d点的向量
  Vector3d obs_dir(framepos - pos_); obs_dir.normalize(); 
  auto min_it=obs_.begin();
  double min_cos_angle = 0;
  for(auto it=obs_.begin(), ite=obs_.end(); it!=ite; ++it)
  {
  	//计算其他观测到这个3d点的KF 和这个3d的方向
    Vector3d dir((*it)->frame->pos() - pos_); dir.normalize();
	// 计算这两个方向的夹角
    double cos_angle = obs_dir.dot(dir);
	// 选择夹角最小的一个
    if(cos_angle > min_cos_angle)
    {
      min_cos_angle = cos_angle;
      min_it = it;
    }
  }
  ftr = *min_it;
  if(min_cos_angle < 0.5) // assume that observations larger than 60掳 are useless
    return false;
  return true;
}

void Point::optimize(const size_t n_iter)
{
  Vector3d old_point = pos_;
  double chi2 = 0.0;
  Matrix3d A;
  Vector3d b;

  for(size_t i=0; i<n_iter; i++)
  {
    A.setZero();
    b.setZero();
    double new_chi2 = 0.0;
    // 将这个point 投影到所有看见他的frame中，进行BA
    // compute residuals
    for(auto it=obs_.begin(); it!=obs_.end(); ++it)
    {
      Matrix23d J; // 图像位置对point 的xyz求导，2x3 matrix
      const Vector3d p_in_f((*it)->frame->T_f_w_ * pos_);
      Point::jacobian_xyz2uv(p_in_f, (*it)->frame->T_f_w_.rotation_matrix(), J);
      const Vector2d e(vk::project2d((*it)->f) - vk::project2d(p_in_f));
      new_chi2 += e.squaredNorm();
      A.noalias() += J.transpose() * J;
      b.noalias() -= J.transpose() * e;
    }

    // solve linear system
    const Vector3d dp(A.ldlt().solve(b));

    // check if error increased
    if((i > 0 && new_chi2 > chi2) || (bool) std::isnan((double)dp[0]))
    {
#ifdef POINT_OPTIMIZER_DEBUG
      cout << "it " << i
           << "\t FAILURE \t new_chi2 = " << new_chi2 << endl;
#endif
      pos_ = old_point; // roll-back
      break;
    }

    // update the model
    Vector3d new_point = pos_ + dp;
    old_point = pos_;
    pos_ = new_point;
    chi2 = new_chi2;
#ifdef POINT_OPTIMIZER_DEBUG
    cout << "it " << i
         << "\t Success \t new_chi2 = " << new_chi2
         << "\t norm(b) = " << vk::norm_max(b)
         << endl;
#endif

    // stop when converged
    if(vk::norm_max(dp) <= EPS)
      break;
  }
#ifdef POINT_OPTIMIZER_DEBUG
  cout << endl;
#endif
}

} // namespace svo
