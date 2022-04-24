cmake_minimum_required(VERSION 3.0.2)
project(emotion_express)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11  -pthread -gdwarf-2" )
## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages

find_package(catkin REQUIRED COMPONENTS
  cv_bridge
  image_transport
  roscpp
  rospy
  std_msgs
)

find_package(OpenCV REQUIRED)

include_directories(${catkin_INCLUDE_DIRS}
      ${cv_bridge_DIR}
      /include/msg/
     /home/zhjd/ws/devel/include/
     /home/kod/robot_ws/devel/include/
    )


catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES emotion_express
#  CATKIN_DEPENDS cv_bridge image_transport roscpp rospy std_msgs
#  DEPENDS system_lib
)


add_executable(emotion_express main.cpp)
target_link_libraries(emotion_express ${catkin_LIBRARIES}  ${OpenCV_LIBS})