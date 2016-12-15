# Install script for directory: /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/src/NonLinearOptimization

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/pang/software/okvis/3rdlib_install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/unsupported/Eigen/src/NonLinearOptimization" TYPE FILE FILES
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/src/NonLinearOptimization/lmpar.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/src/NonLinearOptimization/qrsolv.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/src/NonLinearOptimization/rwupdt.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/src/NonLinearOptimization/LevenbergMarquardt.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/src/NonLinearOptimization/chkder.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/src/NonLinearOptimization/dogleg.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/src/NonLinearOptimization/covar.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/src/NonLinearOptimization/fdjac1.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/src/NonLinearOptimization/r1updt.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/src/NonLinearOptimization/HybridNonLinearSolver.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/src/NonLinearOptimization/r1mpyq.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

