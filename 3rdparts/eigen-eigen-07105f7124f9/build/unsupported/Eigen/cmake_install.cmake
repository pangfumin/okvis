# Install script for directory: /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/unsupported/Eigen" TYPE FILE FILES
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/AdolcForward"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/AlignedVector3"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/ArpackSupport"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/AutoDiff"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/BVH"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/FFT"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/IterativeSolvers"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/KroneckerProduct"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/LevenbergMarquardt"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/MatrixFunctions"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/MoreVectorization"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/MPRealSupport"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/NonLinearOptimization"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/NumericalDiff"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/OpenGLSupport"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/Polynomials"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/Skyline"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/SparseExtra"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/unsupported/Eigen/Splines"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/unsupported/Eigen/src/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

