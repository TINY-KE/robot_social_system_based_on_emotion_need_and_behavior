##############################################################################
# CMake
##############################################################################

cmake_minimum_required(VERSION 3.1.0)
project(visualization)
add_compile_options(-std=c++11)
##############################################################################
# Catkin
##############################################################################

# qt_build provides the qt cmake glue, roscpp the comms for a default talker
find_package(catkin REQUIRED COMPONENTS qt_build roscpp
    rospy
      std_msgs
      geometry_msgs
      message_generation
      )
include_directories(${catkin_INCLUDE_DIRS}
    /home/zhjd/ws/devel/include/
    )

#ros massage自定义
#add_message_files( FILES  perception_msg.msg  need_msg.msg  robot_emotion.msg  robot_status.msg )
## need_compare.msg  person_emotion_assessment.msg  person_emotion_assessment_list.msg

#generate_messages( DEPENDENCIES    roscpp  std_msgs geometry_msgs )

# Use this to define what the package will export (e.g. libs, headers).
# Since the default here is to produce only a binary, we don't worry about
# exporting anything. 
catkin_package()

##############################################################################
# Qt Environment
##############################################################################

# this comes from qt_build's qt-ros.cmake which is automatically 
# included via the dependency call in package.xml
rosbuild_prepare_qt4(QtCore QtGui) # Add the appropriate components to the component list here

##############################################################################
# Sections
##############################################################################

file(GLOB QT_FORMS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} ui/*.ui)
file(GLOB QT_RESOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} resources/*.qrc)
file(GLOB_RECURSE QT_MOC RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} FOLLOW_SYMLINKS include/msg/*.hpp)

QT4_ADD_RESOURCES(QT_RESOURCES_CPP ${QT_RESOURCES})
QT4_WRAP_UI(QT_FORMS_HPP ${QT_FORMS})
QT4_WRAP_CPP(QT_MOC_HPP ${QT_MOC})

##############################################################################
# Sources
##############################################################################

file(GLOB_RECURSE QT_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} FOLLOW_SYMLINKS src/*.cpp)

##############################################################################
# Binaries
##############################################################################

add_executable(main ${QT_SOURCES} ${QT_RESOURCES_CPP} ${QT_FORMS_HPP} ${QT_MOC_HPP})
target_link_libraries(main ${QT_LIBRARIES} ${catkin_LIBRARIES})
install(TARGETS main RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

