cmake_minimum_required(VERSION 3.0.2)
project(emotion_module)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES robot_empathy
  CATKIN_DEPENDS roscpp rospy std_msgs
#  DEPENDS system_lib
)

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)
