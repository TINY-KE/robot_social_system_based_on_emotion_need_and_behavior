cmake_minimum_required(VERSION 3.0)
project(robot_platform)
set(CMAKE_BUILD_TYPE "Debug")
## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11  -pthread -gdwarf-2" )
## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
        roscpp
        rospy
        std_msgs
        geometry_msgs
)
MESSAGE("****catkin dir :${catkin_INCLUDE_DIRS} ")
include_directories(
        include/robot_platform
        ${catkin_INCLUDE_DIRS}
        include
        ${CATKIN_DEVEL_PREFIX}/include/
)


#yaml cpp
# find_package(yaml-cpp REQUIRED)
# include_directories(${YAML_CPP_INCLUDE_DIR})
# MESSAGE("yaml cpp dir : ${YAML_CPP_INCLUDE_DIR} ")
#thread 
find_package(Threads) 


catkin_package(
        LIBRARIES robot_platform
        # CATKIN_DEPENDS  message_runtime
)


#可执行文件
add_executable(platform src/main.cpp )
target_link_libraries(platform ${catkin_LIBRARIES}  yaml-cpp ${CMAKE_THREAD_LIBS_INIT})

add_executable(serial  serial.c   )
target_link_libraries(serial  ${catkin_LIBRARIES}  yaml-cpp ${CMAKE_THREAD_LIBS_INIT} )
