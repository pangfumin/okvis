cmake_minimum_required(VERSION 2.8.11)
project(okvis_visualizer)
# require Pangolin to visualization
find_package(Pangolin REQUIRED)
FIND_PACKAGE(Boost COMPONENTS thread REQUIRED)
# require Eigen
find_package( Eigen REQUIRED )
include_directories(${EIGEN_INCLUDE_DIR}) 

# require OpenCV
find_package( OpenCV COMPONENTS core    REQUIRED )
include_directories(${Pangolin_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} ${OpenCV_INCLUDE_DIRS})
               
# build the library 
add_library(${PROJECT_NAME} 
  #src/MapDrawer.cc
  src/Viewer.cc
  #include/okvis/MapDrawer.h
  include/okvis/Viewer.h
)

# and link it
target_link_libraries(${PROJECT_NAME} 
  PUBLIC okvis_multisensor_processing
  PRIVATE ${Pangolin_LIBRARIES}
  PRIVATE ${Boost_LIBRARIES}
  PRIVATE ${OpenCV_LIBRARIES} 
  
)

# installation if required
install(TARGETS ${PROJECT_NAME}
  EXPORT okvisTargets 
  ARCHIVE DESTINATION "${INSTALL_LIB_DIR}" COMPONENT lib
)
install(DIRECTORY include/ DESTINATION ${INSTALL_INCLUDE_DIR} COMPONENT dev FILES_MATCHING PATTERN "*.hpp")
