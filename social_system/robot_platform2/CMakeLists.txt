cmake_minimum_required(VERSION 3.0)
project(robot_platform)
set(CMAKE_BUILD_TYPE "Debug")
## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++14)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
        roscpp
        rospy
        std_msgs
        geometry_msgs
)
MESSAGE("catkin dir :${catkin_INCLUDE_DIRS} ")
include_directories(
        include/robot_platform
        ${catkin_INCLUDE_DIRS}
        include
        
        /home/zhjd/ws/devel/include/
        # /home/zhjd/ws/src/social_system/robot_platform/include/
)


#yaml cpp
find_package(yaml-cpp REQUIRED)
include_directories(${YAML_CPP_INCLUDE_DIR})
MESSAGE("yaml cpp dir : ${YAML_CPP_INCLUDE_DIR} ")
#thread 
find_package(Threads) 


catkin_package(
        LIBRARIES need_model
        CATKIN_DEPENDS  message_runtime
)


#可执行文件
add_executable(robot_platform src/main.cpp )
target_link_libraries(robot_platform ${catkin_LIBRARIES}  yaml-cpp ${CMAKE_THREAD_LIBS_INIT})

