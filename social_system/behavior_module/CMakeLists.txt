cmake_minimum_required(VERSION 3.0.2)
project(behavior_module)
set(CMAKE_BUILD_TYPE "Debug")

add_compile_options(-std=c++14)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation
  # manage_pkg
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  /home/zhjd/catkin_ws/devel/include/
  /home/zhjd/ws/devel/include/
)
#thread 
find_package(Threads) 

#ros massage自定义
# add_message_files( FILES 
#   Arms.msg
#   Emotion.msg
#   Gaze.msg
#   Legs.msg
#   Speech.msg
#   bhvPara.msg
#   bhvGet.msg
#   bhvIssue.msg
#   bhvReply.msg
#   NeedList.msg
  
# )
# generate_messages(
#   DEPENDENCIES
#   std_msgs
# )
# catkin_package(
#   LIBRARIES manage_pkg
#   CATKIN_DEPENDS roscpp rospy std_msgs message_runtime
# )


## 编译

add_executable(dealing_node src/dealing_node.cpp)
target_link_libraries(dealing_node ${catkin_LIBRARIES})

add_executable(test_node src/test_node.cpp)
target_link_libraries(test_node ${catkin_LIBRARIES})

add_executable(pub_node src/pub_node.cpp)
target_link_libraries(pub_node ${catkin_LIBRARIES})
