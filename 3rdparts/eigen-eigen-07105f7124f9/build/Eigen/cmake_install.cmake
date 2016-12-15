# Install script for directory: /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/Eigen" TYPE FILE FILES
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/SparseLU"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/Dense"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/Cholesky"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/SuperLUSupport"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/SparseQR"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/QR"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/SparseCholesky"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/LU"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/Array"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/Eigenvalues"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/Geometry"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/PaStiXSupport"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/IterativeLinearSolvers"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/StdList"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/SPQRSupport"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/Core"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/Jacobi"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/CholmodSupport"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/OrderingMethods"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/UmfPackSupport"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/Sparse"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/SparseCore"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/MetisSupport"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/Eigen"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/QtAlignedMalloc"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/StdVector"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/StdDeque"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/SVD"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/Householder"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/Eigen2Support"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/LeastSquares"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/PardisoSupport"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/Eigen/src/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

