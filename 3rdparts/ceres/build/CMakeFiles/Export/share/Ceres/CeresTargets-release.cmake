#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ceres" for configuration "Release"
set_property(TARGET ceres APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ceres PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "/home/pang/catkin_ws/devel/lib/libglog.so;/home/pang/catkin_ws/devel/lib/libspqr.a;/usr/lib/libtbb.so;/usr/lib/libtbbmalloc.so;/home/pang/catkin_ws/devel/lib/libcholmod.a;/home/pang/catkin_ws/devel/lib/libccolamd.a;/home/pang/catkin_ws/devel/lib/libcamd.a;/home/pang/catkin_ws/devel/lib/libcolamd.a;/home/pang/catkin_ws/devel/lib/libamd.a;/usr/lib/liblapack.so;/usr/lib/libf77blas.so;/usr/lib/libatlas.so;/usr/lib/libf77blas.so;/usr/lib/libatlas.so;/home/pang/catkin_ws/devel/lib/libsuitesparseconfig.a;/usr/lib/x86_64-linux-gnu/librt.so;/usr/lib/liblapack.so;/usr/lib/libf77blas.so;/usr/lib/libatlas.so;/usr/lib/libf77blas.so;/usr/lib/libatlas.so;gomp;-lpthread"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libceres.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS ceres )
list(APPEND _IMPORT_CHECK_FILES_FOR_ceres "${_IMPORT_PREFIX}/lib/libceres.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
