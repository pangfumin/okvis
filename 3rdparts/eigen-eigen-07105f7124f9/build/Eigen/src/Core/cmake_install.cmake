# Install script for directory: /home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/eigen3/Eigen/src/Core" TYPE FILE FILES
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/CommaInitializer.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/NestByValue.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Transpose.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/IO.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/ArrayBase.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/NumTraits.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/PlainObjectBase.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Swap.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Reverse.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Matrix.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Redux.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/PermutationMatrix.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Replicate.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/ReturnByValue.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/CwiseUnaryOp.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Functors.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/MatrixBase.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/GenericPacketMath.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/DenseBase.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/NoAlias.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Assign_MKL.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Diagonal.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/ForceAlignedAccess.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/BooleanRedux.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Flagged.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/SelfAdjointView.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Dot.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Fuzzy.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/StableNorm.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/VectorwiseOp.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/MathFunctions.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/MapBase.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/GeneralProduct.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/BandMatrix.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/GlobalFunctions.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Array.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/CoreIterators.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Random.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/EigenBase.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/DiagonalMatrix.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/SelfCwiseBinaryOp.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Block.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/CwiseNullaryOp.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/DenseStorage.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Visitor.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/TriangularMatrix.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Stride.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/CwiseUnaryView.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Assign.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Select.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Map.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/DenseCoeffsBase.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Transpositions.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/ArrayWrapper.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/CwiseBinaryOp.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/Ref.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/DiagonalProduct.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/SolveTriangular.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/VectorBlock.h"
    "/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/Eigen/src/Core/ProductBase.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Devel")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/Eigen/src/Core/products/cmake_install.cmake")
  INCLUDE("/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/Eigen/src/Core/util/cmake_install.cmake")
  INCLUDE("/home/pang/software/okvis/3rdparts/eigen-eigen-07105f7124f9/build/Eigen/src/Core/arch/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)
