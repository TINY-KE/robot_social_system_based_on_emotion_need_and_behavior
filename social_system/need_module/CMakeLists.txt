cmake_minimum_required(VERSION 3.0)
project(need_model)
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
        message_generation
        geometry_msgs
#        need_model
#        perception_msgs
        dynamic_reconfigure
)

include_directories(
        include/need_model
        ${catkin_INCLUDE_DIRS}
        include
        /home/zhjd/catkin_ws/src/need_model/
        /home/zhjd/catkin_ws/devel/include/
        /home/zhjd/social_ws/src/need_model/
        /home/zhjd/social_ws/devel/include/
)


#yaml cpp
find_package(yaml-cpp REQUIRED)
include_directories(${YAML_CPP_INCLUDE_DIR})
MESSAGE("yaml cpp dir : ${YAML_CPP_INCLUDE_DIR} ")
#thread 
find_package(Threads) 

#ros massage自定义
add_message_files( FILES perception_msg.msg  
        need_msg.msg  
        robot_emotion.msg  
        robot_status.msg  
        need_compare.msg
        person_emotion_assessment.msg
        person_emotion_assessment_list.msg
        attitude_msg.msg
        need_satisfy_msg.msg
)
generate_messages( DEPENDENCIES    roscpp  std_msgs geometry_msgs )

generate_dynamic_reconfigure_options( 
    cfg/DynamicParam.cfg 

) 

catkin_package(
        LIBRARIES need_model
        CATKIN_DEPENDS  message_runtime
)


#可执行文件
add_executable(need_model core/need_model.cpp  core/perception_filter.cpp)
target_link_libraries(need_model ${catkin_LIBRARIES}  yaml-cpp ${CMAKE_THREAD_LIBS_INIT})

