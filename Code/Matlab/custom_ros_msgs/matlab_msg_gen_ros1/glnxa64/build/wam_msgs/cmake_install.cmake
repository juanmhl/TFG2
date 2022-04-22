# Install script for directory: /home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wam_msgs/msg" TYPE FILE FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_msgs/msg/Location.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wam_msgs/cmake" TYPE FILE FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/build/wam_msgs/catkin_generated/installspace/wam_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/devel/include/wam_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/home/wamremote/.matlab/R2022a/ros1/glnxa64/venv/bin/python3" -m compileall "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/devel/lib/python3/dist-packages/wam_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/devel/lib/python3/dist-packages/wam_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/build/wam_msgs/catkin_generated/installspace/wam_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wam_msgs/cmake" TYPE FILE FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/build/wam_msgs/catkin_generated/installspace/wam_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wam_msgs/cmake" TYPE FILE FILES
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/build/wam_msgs/catkin_generated/installspace/wam_msgsConfig.cmake"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/build/wam_msgs/catkin_generated/installspace/wam_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wam_msgs" TYPE FILE FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_msgs/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_msgs/include/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/devel/lib/libwam_msgs_matlab.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libwam_msgs_matlab.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libwam_msgs_matlab.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libwam_msgs_matlab.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/m/" TYPE DIRECTORY FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_msgs/m/" FILES_MATCHING REGEX "/[^/]*\\.m$")
endif()

