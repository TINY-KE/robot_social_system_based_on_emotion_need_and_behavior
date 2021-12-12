# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "visualize: 4 messages, 0 services")

set(MSG_I_FLAGS "-Ivisualize:/home/zhjd/qtros_ws/src/ex3/msg;-Iroscpp:/opt/ros/kinetic/share/roscpp/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(visualize_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/need_msg.msg" NAME_WE)
add_custom_target(_visualize_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "visualize" "/home/zhjd/qtros_ws/src/ex3/msg/need_msg.msg" ""
)

get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/perception_msg.msg" NAME_WE)
add_custom_target(_visualize_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "visualize" "/home/zhjd/qtros_ws/src/ex3/msg/perception_msg.msg" ""
)

get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/robot_status.msg" NAME_WE)
add_custom_target(_visualize_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "visualize" "/home/zhjd/qtros_ws/src/ex3/msg/robot_status.msg" ""
)

get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/robot_emotion.msg" NAME_WE)
add_custom_target(_visualize_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "visualize" "/home/zhjd/qtros_ws/src/ex3/msg/robot_emotion.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/visualize
)
_generate_msg_cpp(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/visualize
)
_generate_msg_cpp(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/visualize
)
_generate_msg_cpp(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/visualize
)

### Generating Services

### Generating Module File
_generate_module_cpp(visualize
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/visualize
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(visualize_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(visualize_generate_messages visualize_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/need_msg.msg" NAME_WE)
add_dependencies(visualize_generate_messages_cpp _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/perception_msg.msg" NAME_WE)
add_dependencies(visualize_generate_messages_cpp _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/robot_status.msg" NAME_WE)
add_dependencies(visualize_generate_messages_cpp _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/robot_emotion.msg" NAME_WE)
add_dependencies(visualize_generate_messages_cpp _visualize_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(visualize_gencpp)
add_dependencies(visualize_gencpp visualize_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS visualize_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/visualize
)
_generate_msg_eus(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/visualize
)
_generate_msg_eus(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/visualize
)
_generate_msg_eus(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/visualize
)

### Generating Services

### Generating Module File
_generate_module_eus(visualize
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/visualize
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(visualize_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(visualize_generate_messages visualize_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/need_msg.msg" NAME_WE)
add_dependencies(visualize_generate_messages_eus _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/perception_msg.msg" NAME_WE)
add_dependencies(visualize_generate_messages_eus _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/robot_status.msg" NAME_WE)
add_dependencies(visualize_generate_messages_eus _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/robot_emotion.msg" NAME_WE)
add_dependencies(visualize_generate_messages_eus _visualize_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(visualize_geneus)
add_dependencies(visualize_geneus visualize_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS visualize_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/visualize
)
_generate_msg_lisp(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/visualize
)
_generate_msg_lisp(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/visualize
)
_generate_msg_lisp(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/visualize
)

### Generating Services

### Generating Module File
_generate_module_lisp(visualize
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/visualize
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(visualize_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(visualize_generate_messages visualize_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/need_msg.msg" NAME_WE)
add_dependencies(visualize_generate_messages_lisp _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/perception_msg.msg" NAME_WE)
add_dependencies(visualize_generate_messages_lisp _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/robot_status.msg" NAME_WE)
add_dependencies(visualize_generate_messages_lisp _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/robot_emotion.msg" NAME_WE)
add_dependencies(visualize_generate_messages_lisp _visualize_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(visualize_genlisp)
add_dependencies(visualize_genlisp visualize_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS visualize_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/visualize
)
_generate_msg_nodejs(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/visualize
)
_generate_msg_nodejs(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/visualize
)
_generate_msg_nodejs(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/visualize
)

### Generating Services

### Generating Module File
_generate_module_nodejs(visualize
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/visualize
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(visualize_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(visualize_generate_messages visualize_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/need_msg.msg" NAME_WE)
add_dependencies(visualize_generate_messages_nodejs _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/perception_msg.msg" NAME_WE)
add_dependencies(visualize_generate_messages_nodejs _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/robot_status.msg" NAME_WE)
add_dependencies(visualize_generate_messages_nodejs _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/robot_emotion.msg" NAME_WE)
add_dependencies(visualize_generate_messages_nodejs _visualize_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(visualize_gennodejs)
add_dependencies(visualize_gennodejs visualize_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS visualize_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/need_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visualize
)
_generate_msg_py(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/robot_status.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visualize
)
_generate_msg_py(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/perception_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visualize
)
_generate_msg_py(visualize
  "/home/zhjd/qtros_ws/src/ex3/msg/robot_emotion.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visualize
)

### Generating Services

### Generating Module File
_generate_module_py(visualize
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visualize
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(visualize_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(visualize_generate_messages visualize_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/need_msg.msg" NAME_WE)
add_dependencies(visualize_generate_messages_py _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/perception_msg.msg" NAME_WE)
add_dependencies(visualize_generate_messages_py _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/robot_status.msg" NAME_WE)
add_dependencies(visualize_generate_messages_py _visualize_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhjd/qtros_ws/src/ex3/msg/robot_emotion.msg" NAME_WE)
add_dependencies(visualize_generate_messages_py _visualize_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(visualize_genpy)
add_dependencies(visualize_genpy visualize_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS visualize_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/visualize)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/visualize
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_cpp)
  add_dependencies(visualize_generate_messages_cpp roscpp_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(visualize_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(visualize_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/visualize)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/visualize
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_eus)
  add_dependencies(visualize_generate_messages_eus roscpp_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(visualize_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(visualize_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/visualize)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/visualize
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_lisp)
  add_dependencies(visualize_generate_messages_lisp roscpp_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(visualize_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(visualize_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/visualize)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/visualize
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_nodejs)
  add_dependencies(visualize_generate_messages_nodejs roscpp_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(visualize_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(visualize_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visualize)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visualize\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/visualize
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET roscpp_generate_messages_py)
  add_dependencies(visualize_generate_messages_py roscpp_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(visualize_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(visualize_generate_messages_py geometry_msgs_generate_messages_py)
endif()
