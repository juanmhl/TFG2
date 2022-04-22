# Install script for directory: /home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wam_common/msg" TYPE FILE FILES
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTCartPos.msg"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTCartVel.msg"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointPos.msg"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointTrq.msg"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointVel.msg"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTOrtnPos.msg"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTOrtnVel.msg"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTPose.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wam_common/srv" TYPE FILE FILES
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandFingerPos.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandFingerVel.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandGraspPos.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandGraspVel.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandSpreadPos.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandSpreadVel.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/CartPosMove.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/ChangeMinirobot.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/CouplingWam.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/DirMove.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/GravityComp.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Hold.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/IdleWam.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/JointMove.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Move.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/OrtnMove.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Pose.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/PoseMove.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Wrist.srv"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/WristRotate.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wam_common/cmake" TYPE FILE FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/build/wam_common/catkin_generated/installspace/wam_common-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/devel/include/wam_common")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/home/wamremote/.matlab/R2022a/ros1/glnxa64/venv/bin/python3" -m compileall "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/devel/lib/python3/dist-packages/wam_common")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/devel/lib/python3/dist-packages/wam_common")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/build/wam_common/catkin_generated/installspace/wam_common.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wam_common/cmake" TYPE FILE FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/build/wam_common/catkin_generated/installspace/wam_common-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wam_common/cmake" TYPE FILE FILES
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/build/wam_common/catkin_generated/installspace/wam_commonConfig.cmake"
    "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/build/wam_common/catkin_generated/installspace/wam_commonConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wam_common" TYPE FILE FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/include/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/devel/lib/libwam_common_matlab.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libwam_common_matlab.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libwam_common_matlab.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libwam_common_matlab.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/m/" TYPE DIRECTORY FILES "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/m/" FILES_MATCHING REGEX "/[^/]*\\.m$")
endif()

