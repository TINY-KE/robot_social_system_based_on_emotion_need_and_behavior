# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "interface_sim: 4 messages, 0 services")

set(MSG_I_FLAGS "-Iinterface_sim:/home/zhjd/catkin_ws/src/interface_sim/msg;-Iroscpp:/opt/ros/kinetic/share/roscpp/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(interface_sim_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_emotion.msg" NAME_WE)
add_custom_target(_interface_sim_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interface_sim" "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_emotion.msg" ""
)

get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/need_msg.msg" NAME_WE)
add_custom_target(_interface_sim_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interface_sim" "/home/zhjd/catkin_ws/src/interface_sim/msg/need_msg.msg" ""
)

get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_status.msg" NAME_WE)
add_custom_target(_interface_sim_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interface_sim" "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_status.msg" ""
)

get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/perception_msg.msg" NAME_WE)
add_custom_target(_interface_sim_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interface_sim" "/home/zhjd/catkin_ws/src/interface_sim/msg/perception_msg.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interface_sim
)
_generate_msg_cpp(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interface_sim
)
_generate_msg_cpp(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interface_sim
)
_generate_msg_cpp(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interface_sim
)

### Generating Services

### Generating Module File
_generate_module_cpp(interface_sim
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interface_sim
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(interface_sim_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(interface_sim_generate_messages interface_sim_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_emotion.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_cpp _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/need_msg.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_cpp _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_status.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_cpp _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/perception_msg.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_cpp _interface_sim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interface_sim_gencpp)
add_dependencies(interface_sim_gencpp interface_sim_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interface_sim_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interface_sim
)
_generate_msg_eus(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interface_sim
)
_generate_msg_eus(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interface_sim
)
_generate_msg_eus(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interface_sim
)

### Generating Services

### Generating Module File
_generate_module_eus(interface_sim
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interface_sim
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(interface_sim_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(interface_sim_generate_messages interface_sim_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_emotion.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_eus _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/need_msg.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_eus _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_status.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_eus _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/perception_msg.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_eus _interface_sim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interface_sim_geneus)
add_dependencies(interface_sim_geneus interface_sim_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interface_sim_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interface_sim
)
_generate_msg_lisp(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interface_sim
)
_generate_msg_lisp(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interface_sim
)
_generate_msg_lisp(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interface_sim
)

### Generating Services

### Generating Module File
_generate_module_lisp(interface_sim
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interface_sim
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(interface_sim_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(interface_sim_generate_messages interface_sim_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_emotion.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_lisp _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/need_msg.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_lisp _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_status.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_lisp _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/perception_msg.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_lisp _interface_sim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interface_sim_genlisp)
add_dependencies(interface_sim_genlisp interface_sim_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interface_sim_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interface_sim
)
_generate_msg_nodejs(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interface_sim
)
_generate_msg_nodejs(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interface_sim
)
_generate_msg_nodejs(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interface_sim
)

### Generating Services

### Generating Module File
_generate_module_nodejs(interface_sim
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interface_sim
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(interface_sim_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(interface_sim_generate_messages interface_sim_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_emotion.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_nodejs _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/need_msg.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_nodejs _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_status.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_nodejs _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/perception_msg.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_nodejs _interface_sim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interface_sim_gennodejs)
add_dependencies(interface_sim_gennodejs interface_sim_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interface_sim_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interface_sim
)
_generate_msg_py(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interface_sim
)
_generate_msg_py(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interface_sim
)
_generate_msg_py(interface_sim
  "/home/zhjd/catkin_ws/src/interface_sim/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interface_sim
)

### Generating Services

### Generating Module File
_generate_module_py(interface_sim
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interface_sim
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(interface_sim_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(interface_sim_generate_messages interface_sim_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_emotion.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_py _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/need_msg.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_py _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/robot_status.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_py _interface_sim_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/catkin_ws/src/interface_sim/msg/perception_msg.msg" NAME_WE)
add_dependencies(interface_sim_generate_messages_py _interface_sim_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interface_sim_genpy)
add_dependencies(interface_sim_genpy interface_sim_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interface_sim_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interface_sim)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interface_sim
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_cpp)
  add_dependencies(interface_sim_generate_messages_cpp roscpp_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(interface_sim_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(interface_sim_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interface_sim)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interface_sim
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_eus)
  add_dependencies(interface_sim_generate_messages_eus roscpp_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(interface_sim_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(interface_sim_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interface_sim)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interface_sim
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_lisp)
  add_dependencies(interface_sim_generate_messages_lisp roscpp_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(interface_sim_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(interface_sim_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interface_sim)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interface_sim
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_nodejs)
  add_dependencies(interface_sim_generate_messages_nodejs roscpp_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(interface_sim_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(interface_sim_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interface_sim)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interface_sim\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interface_sim
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_py)
  add_dependencies(interface_sim_generate_messages_py roscpp_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(interface_sim_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(interface_sim_generate_messages_py geometry_msgs_generate_messages_py)
endif()
