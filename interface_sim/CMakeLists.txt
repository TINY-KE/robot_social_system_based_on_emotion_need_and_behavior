cmake_minimum_required(VERSION 3.0.2)
project(interface_sim)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  dynamic_reconfigure
  roscpp
  rospy
  std_msgs
  geometry_msgs
  message_generation
)

## DEPENDS: system dependencies of this project that dependent projects also need


include_directories(
 include
  ${catkin_INCLUDE_DIRS}
  ${CATKIN_DEVEL_PREFIX}/include/
)

#ros massage自定义
# add_message_files( FILES perception_msg.msg  need_msg.msg  robot_emotion.msg  robot_status.msg )
# generate_messages( DEPENDENCIES    roscpp  std_msgs geometry_msgs )


generate_dynamic_reconfigure_options(
   include/cfg.cfg
 )
 
add_executable(sim sim.cpp)
add_dependencies(sim ${PROJECT_NAME}_gencfg)
 
target_link_libraries(sim ${catkin_LIBRARIES})
