# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "social_msg: 15 messages, 0 services")

set(MSG_I_FLAGS "-Isocial_msg:/home/zhjd/ws/src/social_system/social_msg/msg;-Iroscpp:/opt/ros/kinetic/share/roscpp/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(social_msg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/need_satisfy_msg.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/need_satisfy_msg.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/perception_msg.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/perception_msg.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvIssue.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/bhvIssue.msg" "social_msg/Gaze:social_msg/Arms:social_msg/Speech:social_msg/Legs:social_msg/Emotion"
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/need_msg.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/need_msg.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvPara.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/bhvPara.msg" "social_msg/Gaze:social_msg/Arms:social_msg/Speech:social_msg/Legs:social_msg/Emotion"
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/robot_status.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/robot_status.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/robot_emotion.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/robot_emotion.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvGet.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/bhvGet.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/attitude_msg.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/attitude_msg.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvReply.msg" NAME_WE)
add_custom_target(_social_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "social_msg" "/home/zhjd/ws/src/social_system/social_msg/msg/bhvReply.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/need_satisfy_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvIssue.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvPara.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvGet.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvReply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/attitude_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)
_generate_msg_cpp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
)

### Generating Services

### Generating Module File
_generate_module_cpp(social_msg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(social_msg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(social_msg_generate_messages social_msg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/need_satisfy_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/perception_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvIssue.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/need_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvPara.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/robot_status.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/robot_emotion.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvGet.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/attitude_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvReply.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_cpp _social_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(social_msg_gencpp)
add_dependencies(social_msg_gencpp social_msg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS social_msg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/need_satisfy_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvIssue.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvPara.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvGet.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvReply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/attitude_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)
_generate_msg_eus(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
)

### Generating Services

### Generating Module File
_generate_module_eus(social_msg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(social_msg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(social_msg_generate_messages social_msg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/need_satisfy_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/perception_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvIssue.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/need_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvPara.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/robot_status.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/robot_emotion.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvGet.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/attitude_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvReply.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_eus _social_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(social_msg_geneus)
add_dependencies(social_msg_geneus social_msg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS social_msg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/need_satisfy_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvIssue.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvPara.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvGet.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvReply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/attitude_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)
_generate_msg_lisp(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
)

### Generating Services

### Generating Module File
_generate_module_lisp(social_msg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(social_msg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(social_msg_generate_messages social_msg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/need_satisfy_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/perception_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvIssue.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/need_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvPara.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/robot_status.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/robot_emotion.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvGet.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/attitude_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvReply.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_lisp _social_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(social_msg_genlisp)
add_dependencies(social_msg_genlisp social_msg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS social_msg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/need_satisfy_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvIssue.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvPara.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvGet.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvReply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/attitude_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)
_generate_msg_nodejs(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
)

### Generating Services

### Generating Module File
_generate_module_nodejs(social_msg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(social_msg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(social_msg_generate_messages social_msg_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/need_satisfy_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/perception_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvIssue.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/need_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvPara.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/robot_status.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/robot_emotion.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvGet.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/attitude_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvReply.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_nodejs _social_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(social_msg_gennodejs)
add_dependencies(social_msg_gennodejs social_msg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS social_msg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/need_satisfy_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvIssue.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvPara.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg;/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvGet.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/bhvReply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/attitude_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)
_generate_msg_py(social_msg
  "/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
)

### Generating Services

### Generating Module File
_generate_module_py(social_msg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(social_msg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(social_msg_generate_messages social_msg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/need_satisfy_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/perception_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Gaze.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvIssue.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/need_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvPara.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Speech.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/robot_status.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/robot_emotion.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvGet.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Arms.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Emotion.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/attitude_msg.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/Legs.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/social_msg/msg/bhvReply.msg" NAME_WE)
add_dependencies(social_msg_generate_messages_py _social_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(social_msg_genpy)
add_dependencies(social_msg_genpy social_msg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS social_msg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/social_msg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_cpp)
  add_dependencies(social_msg_generate_messages_cpp roscpp_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(social_msg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(social_msg_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/social_msg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_eus)
  add_dependencies(social_msg_generate_messages_eus roscpp_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(social_msg_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(social_msg_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/social_msg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_lisp)
  add_dependencies(social_msg_generate_messages_lisp roscpp_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(social_msg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(social_msg_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/social_msg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_nodejs)
  add_dependencies(social_msg_generate_messages_nodejs roscpp_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(social_msg_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(social_msg_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/social_msg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_py)
  add_dependencies(social_msg_generate_messages_py roscpp_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(social_msg_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(social_msg_generate_messages_py geometry_msgs_generate_messages_py)
endif()
