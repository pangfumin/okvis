# Install script for directory: /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/Eigen/src/Eigenvalues" TYPE FILE FILES
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues/RealQZ.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues/RealSchur_MKL.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues/SelfAdjointEigenSolver_MKL.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues/GeneralizedEigenSolver.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues/HessenbergDecomposition.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues/MatrixBaseEigenvalues.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues/ComplexSchur_MKL.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues/RealSchur.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues/ComplexEigenSolver.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues/ComplexSchur.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues/GeneralizedSelfAdjointEigenSolver.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues/SelfAdjointEigenSolver.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues/EigenSolver.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Eigenvalues/Tridiagonalization.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

