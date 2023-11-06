##############################################################################
# CMake
##############################################################################

cmake_minimum_required(VERSION 3.1.0)
project(visualization)
add_compile_options(-std=c++11)
set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")
##############################################################################
# Catkin
##############################################################################

# qt_build provides the qt cmake glue, roscpp the comms for a default talker
find_package(catkin REQUIRED COMPONENTS qt_build roscpp
      rospy
      std_msgs
      geometry_msgs
      message_generation
      cv_bridge

      image_transport
      )


#set(OpenCV_DIR "/home/.../thirdparty/opencv3.4.10/opencv-3.4.10/build")
find_package(OpenCV REQUIRED)
#find_package(QT NAMES Qt5 COMPONENTS Widgets Multimedia REQUIRED)

find_package(QT NAMES Qt5 COMPONENTS Widgets Multimedia MultimediaWidgets REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Widgets Multimedia MultimediaWidgets REQUIRED)

find_package(Qt5 ${USED_QT_VERSION} REQUIRED COMPONENTS
    Core
    Widgets
    Svg
    Multimedia
    MultimediaWidgets
)


include_directories(${catkin_INCLUDE_DIRS}
      /include/msg/
      ${CATKIN_DEVEL_PREFIX}/include/
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

file(GLOB QT_FORMS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} ui/main_window.ui)
file(GLOB QT_RESOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} resources/images.qrc )
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
target_link_libraries(main ${QT_LIBRARIES} ${catkin_LIBRARIES}  ${OpenCV_LIBS}
#    WidgetsLib
#       DataAccessLayer
       Qt5::Core
       Qt5::Widgets
       Qt5::Svg
       Qt5::Multimedia
       Qt5::MultimediaWidgets
       )
install(TARGETS main RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

