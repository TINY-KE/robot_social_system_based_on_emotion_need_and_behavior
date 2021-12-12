# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "need_model: 9 messages, 0 services")

set(MSG_I_FLAGS "-Ineed_model:/home/zhjd/ws/src/social_system/need_module/msg;-Iroscpp:/opt/ros/kinetic/share/roscpp/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(need_model_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/attitude_msg.msg" NAME_WE)
add_custom_target(_need_model_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "need_model" "/home/zhjd/ws/src/social_system/need_module/msg/attitude_msg.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment_list.msg" NAME_WE)
add_custom_target(_need_model_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "need_model" "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment_list.msg" "need_model/person_emotion_assessment"
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg" NAME_WE)
add_custom_target(_need_model_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "need_model" "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_compare.msg" NAME_WE)
add_custom_target(_need_model_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "need_model" "/home/zhjd/ws/src/social_system/need_module/msg/need_compare.msg" "need_model/need_msg"
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/robot_emotion.msg" NAME_WE)
add_custom_target(_need_model_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "need_model" "/home/zhjd/ws/src/social_system/need_module/msg/robot_emotion.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_satisfy_msg.msg" NAME_WE)
add_custom_target(_need_model_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "need_model" "/home/zhjd/ws/src/social_system/need_module/msg/need_satisfy_msg.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/perception_msg.msg" NAME_WE)
add_custom_target(_need_model_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "need_model" "/home/zhjd/ws/src/social_system/need_module/msg/perception_msg.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg" NAME_WE)
add_custom_target(_need_model_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "need_model" "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg" ""
)

get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/robot_status.msg" NAME_WE)
add_custom_target(_need_model_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "need_model" "/home/zhjd/ws/src/social_system/need_module/msg/robot_status.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/attitude_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/need_model
)
_generate_msg_cpp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment_list.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/need_model
)
_generate_msg_cpp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/need_model
)
_generate_msg_cpp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_compare.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/need_model
)
_generate_msg_cpp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/need_model
)
_generate_msg_cpp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_satisfy_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/need_model
)
_generate_msg_cpp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/need_model
)
_generate_msg_cpp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/need_model
)
_generate_msg_cpp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/need_model
)

### Generating Services

### Generating Module File
_generate_module_cpp(need_model
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/need_model
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(need_model_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(need_model_generate_messages need_model_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/attitude_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_cpp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment_list.msg" NAME_WE)
add_dependencies(need_model_generate_messages_cpp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_cpp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_compare.msg" NAME_WE)
add_dependencies(need_model_generate_messages_cpp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/robot_emotion.msg" NAME_WE)
add_dependencies(need_model_generate_messages_cpp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_satisfy_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_cpp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/perception_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_cpp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg" NAME_WE)
add_dependencies(need_model_generate_messages_cpp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/robot_status.msg" NAME_WE)
add_dependencies(need_model_generate_messages_cpp _need_model_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(need_model_gencpp)
add_dependencies(need_model_gencpp need_model_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS need_model_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/attitude_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/need_model
)
_generate_msg_eus(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment_list.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/need_model
)
_generate_msg_eus(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/need_model
)
_generate_msg_eus(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_compare.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/need_model
)
_generate_msg_eus(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/need_model
)
_generate_msg_eus(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_satisfy_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/need_model
)
_generate_msg_eus(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/need_model
)
_generate_msg_eus(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/need_model
)
_generate_msg_eus(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/need_model
)

### Generating Services

### Generating Module File
_generate_module_eus(need_model
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/need_model
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(need_model_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(need_model_generate_messages need_model_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/attitude_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_eus _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment_list.msg" NAME_WE)
add_dependencies(need_model_generate_messages_eus _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_eus _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_compare.msg" NAME_WE)
add_dependencies(need_model_generate_messages_eus _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/robot_emotion.msg" NAME_WE)
add_dependencies(need_model_generate_messages_eus _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_satisfy_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_eus _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/perception_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_eus _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg" NAME_WE)
add_dependencies(need_model_generate_messages_eus _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/robot_status.msg" NAME_WE)
add_dependencies(need_model_generate_messages_eus _need_model_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(need_model_geneus)
add_dependencies(need_model_geneus need_model_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS need_model_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/attitude_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/need_model
)
_generate_msg_lisp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment_list.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/need_model
)
_generate_msg_lisp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/need_model
)
_generate_msg_lisp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_compare.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/need_model
)
_generate_msg_lisp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/need_model
)
_generate_msg_lisp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_satisfy_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/need_model
)
_generate_msg_lisp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/need_model
)
_generate_msg_lisp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/need_model
)
_generate_msg_lisp(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/need_model
)

### Generating Services

### Generating Module File
_generate_module_lisp(need_model
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/need_model
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(need_model_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(need_model_generate_messages need_model_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/attitude_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_lisp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment_list.msg" NAME_WE)
add_dependencies(need_model_generate_messages_lisp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_lisp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_compare.msg" NAME_WE)
add_dependencies(need_model_generate_messages_lisp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/robot_emotion.msg" NAME_WE)
add_dependencies(need_model_generate_messages_lisp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_satisfy_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_lisp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/perception_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_lisp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg" NAME_WE)
add_dependencies(need_model_generate_messages_lisp _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/robot_status.msg" NAME_WE)
add_dependencies(need_model_generate_messages_lisp _need_model_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(need_model_genlisp)
add_dependencies(need_model_genlisp need_model_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS need_model_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/attitude_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/need_model
)
_generate_msg_nodejs(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment_list.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/need_model
)
_generate_msg_nodejs(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/need_model
)
_generate_msg_nodejs(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_compare.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/need_model
)
_generate_msg_nodejs(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/need_model
)
_generate_msg_nodejs(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_satisfy_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/need_model
)
_generate_msg_nodejs(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/need_model
)
_generate_msg_nodejs(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/need_model
)
_generate_msg_nodejs(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/need_model
)

### Generating Services

### Generating Module File
_generate_module_nodejs(need_model
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/need_model
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(need_model_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(need_model_generate_messages need_model_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/attitude_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_nodejs _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment_list.msg" NAME_WE)
add_dependencies(need_model_generate_messages_nodejs _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_nodejs _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_compare.msg" NAME_WE)
add_dependencies(need_model_generate_messages_nodejs _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/robot_emotion.msg" NAME_WE)
add_dependencies(need_model_generate_messages_nodejs _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_satisfy_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_nodejs _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/perception_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_nodejs _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg" NAME_WE)
add_dependencies(need_model_generate_messages_nodejs _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/robot_status.msg" NAME_WE)
add_dependencies(need_model_generate_messages_nodejs _need_model_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(need_model_gennodejs)
add_dependencies(need_model_gennodejs need_model_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS need_model_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/attitude_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/need_model
)
_generate_msg_py(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment_list.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/need_model
)
_generate_msg_py(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/need_model
)
_generate_msg_py(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_compare.msg"
  "${MSG_I_FLAGS}"
  "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/need_model
)
_generate_msg_py(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/need_model
)
_generate_msg_py(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/need_satisfy_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/need_model
)
_generate_msg_py(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/need_model
)
_generate_msg_py(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/need_model
)
_generate_msg_py(need_model
  "/home/zhjd/ws/src/social_system/need_module/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/need_model
)

### Generating Services

### Generating Module File
_generate_module_py(need_model
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/need_model
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(need_model_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(need_model_generate_messages need_model_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/attitude_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_py _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment_list.msg" NAME_WE)
add_dependencies(need_model_generate_messages_py _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_py _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_compare.msg" NAME_WE)
add_dependencies(need_model_generate_messages_py _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/robot_emotion.msg" NAME_WE)
add_dependencies(need_model_generate_messages_py _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/need_satisfy_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_py _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/perception_msg.msg" NAME_WE)
add_dependencies(need_model_generate_messages_py _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/person_emotion_assessment.msg" NAME_WE)
add_dependencies(need_model_generate_messages_py _need_model_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/ws/src/social_system/need_module/msg/robot_status.msg" NAME_WE)
add_dependencies(need_model_generate_messages_py _need_model_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(need_model_genpy)
add_dependencies(need_model_genpy need_model_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS need_model_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/need_model)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/need_model
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_cpp)
  add_dependencies(need_model_generate_messages_cpp roscpp_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(need_model_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(need_model_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/need_model)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/need_model
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_eus)
  add_dependencies(need_model_generate_messages_eus roscpp_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(need_model_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(need_model_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/need_model)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/need_model
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_lisp)
  add_dependencies(need_model_generate_messages_lisp roscpp_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(need_model_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(need_model_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/need_model)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/need_model
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_nodejs)
  add_dependencies(need_model_generate_messages_nodejs roscpp_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(need_model_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(need_model_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/need_model)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/need_model\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/need_model
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_py)
  add_dependencies(need_model_generate_messages_py roscpp_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(need_model_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(need_model_generate_messages_py geometry_msgs_generate_messages_py)
endif()
