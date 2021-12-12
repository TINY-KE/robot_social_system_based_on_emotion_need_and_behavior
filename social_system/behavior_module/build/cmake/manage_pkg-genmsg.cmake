# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "manage_pkg: 10 messages, 0 services")

set(MSG_I_FLAGS "-Imanage_pkg:/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(manage_pkg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/NeedList.msg" NAME_WE)
add_custom_target(_manage_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manage_pkg" "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/NeedList.msg" ""
)

get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg" NAME_WE)
add_custom_target(_manage_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manage_pkg" "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg" ""
)

get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvPara.msg" NAME_WE)
add_custom_target(_manage_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manage_pkg" "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvPara.msg" "manage_pkg/Arms:manage_pkg/Speech:manage_pkg/Legs:manage_pkg/Emotion:manage_pkg/Gaze"
)

get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg" NAME_WE)
add_custom_target(_manage_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manage_pkg" "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg" ""
)

get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvGet.msg" NAME_WE)
add_custom_target(_manage_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manage_pkg" "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvGet.msg" ""
)

get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvReply.msg" NAME_WE)
add_custom_target(_manage_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manage_pkg" "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvReply.msg" ""
)

get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg" NAME_WE)
add_custom_target(_manage_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manage_pkg" "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg" ""
)

get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg" NAME_WE)
add_custom_target(_manage_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manage_pkg" "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg" ""
)

get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvIssue.msg" NAME_WE)
add_custom_target(_manage_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manage_pkg" "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvIssue.msg" "manage_pkg/Arms:manage_pkg/Speech:manage_pkg/Legs:manage_pkg/Emotion:manage_pkg/Gaze"
)

get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg" NAME_WE)
add_custom_target(_manage_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manage_pkg" "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvIssue.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manage_pkg
)
_generate_msg_cpp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/NeedList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manage_pkg
)
_generate_msg_cpp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvPara.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manage_pkg
)
_generate_msg_cpp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manage_pkg
)
_generate_msg_cpp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvGet.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manage_pkg
)
_generate_msg_cpp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvReply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manage_pkg
)
_generate_msg_cpp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manage_pkg
)
_generate_msg_cpp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manage_pkg
)
_generate_msg_cpp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manage_pkg
)
_generate_msg_cpp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manage_pkg
)

### Generating Services

### Generating Module File
_generate_module_cpp(manage_pkg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manage_pkg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(manage_pkg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(manage_pkg_generate_messages manage_pkg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/NeedList.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_cpp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_cpp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvPara.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_cpp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_cpp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvGet.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_cpp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvReply.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_cpp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_cpp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_cpp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvIssue.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_cpp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_cpp _manage_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manage_pkg_gencpp)
add_dependencies(manage_pkg_gencpp manage_pkg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manage_pkg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvIssue.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manage_pkg
)
_generate_msg_eus(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/NeedList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manage_pkg
)
_generate_msg_eus(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvPara.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manage_pkg
)
_generate_msg_eus(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manage_pkg
)
_generate_msg_eus(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvGet.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manage_pkg
)
_generate_msg_eus(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvReply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manage_pkg
)
_generate_msg_eus(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manage_pkg
)
_generate_msg_eus(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manage_pkg
)
_generate_msg_eus(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manage_pkg
)
_generate_msg_eus(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manage_pkg
)

### Generating Services

### Generating Module File
_generate_module_eus(manage_pkg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manage_pkg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(manage_pkg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(manage_pkg_generate_messages manage_pkg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/NeedList.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_eus _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_eus _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvPara.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_eus _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_eus _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvGet.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_eus _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvReply.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_eus _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_eus _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_eus _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvIssue.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_eus _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_eus _manage_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manage_pkg_geneus)
add_dependencies(manage_pkg_geneus manage_pkg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manage_pkg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvIssue.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manage_pkg
)
_generate_msg_lisp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/NeedList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manage_pkg
)
_generate_msg_lisp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvPara.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manage_pkg
)
_generate_msg_lisp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manage_pkg
)
_generate_msg_lisp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvGet.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manage_pkg
)
_generate_msg_lisp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvReply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manage_pkg
)
_generate_msg_lisp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manage_pkg
)
_generate_msg_lisp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manage_pkg
)
_generate_msg_lisp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manage_pkg
)
_generate_msg_lisp(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manage_pkg
)

### Generating Services

### Generating Module File
_generate_module_lisp(manage_pkg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manage_pkg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(manage_pkg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(manage_pkg_generate_messages manage_pkg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/NeedList.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_lisp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_lisp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvPara.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_lisp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_lisp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvGet.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_lisp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvReply.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_lisp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_lisp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_lisp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvIssue.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_lisp _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_lisp _manage_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manage_pkg_genlisp)
add_dependencies(manage_pkg_genlisp manage_pkg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manage_pkg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvIssue.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manage_pkg
)
_generate_msg_nodejs(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/NeedList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manage_pkg
)
_generate_msg_nodejs(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvPara.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manage_pkg
)
_generate_msg_nodejs(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manage_pkg
)
_generate_msg_nodejs(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvGet.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manage_pkg
)
_generate_msg_nodejs(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvReply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manage_pkg
)
_generate_msg_nodejs(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manage_pkg
)
_generate_msg_nodejs(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manage_pkg
)
_generate_msg_nodejs(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manage_pkg
)
_generate_msg_nodejs(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manage_pkg
)

### Generating Services

### Generating Module File
_generate_module_nodejs(manage_pkg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manage_pkg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(manage_pkg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(manage_pkg_generate_messages manage_pkg_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/NeedList.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_nodejs _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_nodejs _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvPara.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_nodejs _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_nodejs _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvGet.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_nodejs _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvReply.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_nodejs _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_nodejs _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_nodejs _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvIssue.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_nodejs _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_nodejs _manage_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manage_pkg_gennodejs)
add_dependencies(manage_pkg_gennodejs manage_pkg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manage_pkg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvIssue.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manage_pkg
)
_generate_msg_py(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/NeedList.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manage_pkg
)
_generate_msg_py(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvPara.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg;/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manage_pkg
)
_generate_msg_py(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manage_pkg
)
_generate_msg_py(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvGet.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manage_pkg
)
_generate_msg_py(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvReply.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manage_pkg
)
_generate_msg_py(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manage_pkg
)
_generate_msg_py(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manage_pkg
)
_generate_msg_py(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manage_pkg
)
_generate_msg_py(manage_pkg
  "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manage_pkg
)

### Generating Services

### Generating Module File
_generate_module_py(manage_pkg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manage_pkg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(manage_pkg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(manage_pkg_generate_messages manage_pkg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/NeedList.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_py _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Arms.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_py _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvPara.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_py _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Legs.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_py _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvGet.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_py _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvReply.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_py _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Gaze.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_py _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Speech.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_py _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/bhvIssue.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_py _manage_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/social_ws/src/behavior_system_based_on_emotion_and_need/behavior_module/msg/Emotion.msg" NAME_WE)
add_dependencies(manage_pkg_generate_messages_py _manage_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manage_pkg_genpy)
add_dependencies(manage_pkg_genpy manage_pkg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manage_pkg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manage_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manage_pkg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(manage_pkg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manage_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manage_pkg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(manage_pkg_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manage_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manage_pkg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(manage_pkg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manage_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manage_pkg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(manage_pkg_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manage_pkg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manage_pkg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manage_pkg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(manage_pkg_generate_messages_py std_msgs_generate_messages_py)
endif()
