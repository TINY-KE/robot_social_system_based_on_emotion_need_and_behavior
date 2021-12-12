cmake_minimum_required(VERSION 3.0)
project(social_msg)
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
        # social_msg
        dynamic_reconfigure
)

include_directories(
        ${catkin_INCLUDE_DIRS}
        include
)


#ros massage自定义
add_message_files( FILES 
        #由课题124生成
        perception_msg.msg
        attitude_msg.msg
        robot_status.msg
        
        #由行为模块生成
        need_satisfy_msg.msg

        # 情感模块输出
        robot_emotion.msg
        
        #需求模块输出
        need_msg.msg  
        
        #自适应模块输入
        need_compare.msg
        person_emotion_assessment.msg
        person_emotion_assessment_list.msg

        #行为模块输出
        Arms.msg
        Emotion.msg
        Gaze.msg
        Legs.msg
        Speech.msg
        bhvPara.msg     #分步
        bhvIssue.msg    #分步
        bhvGet.msg
        bhvReply.msg
        # NeedList.msg
)
generate_messages( DEPENDENCIES    roscpp  std_msgs geometry_msgs )

# generate_dynamic_reconfigure_options( 
#     cfg/DynamicParam.cfg 

# ) 

catkin_package(
        LIBRARIES social_msg
        CATKIN_DEPENDS  message_runtime
)

