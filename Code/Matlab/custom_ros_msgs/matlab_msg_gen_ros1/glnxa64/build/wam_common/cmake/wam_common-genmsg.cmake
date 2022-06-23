# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "wam_common: 8 messages, 20 services")

set(MSG_I_FLAGS "-Iwam_common:/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg;-Istd_msgs:/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg;-Igeometry_msgs:/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg;-Istd_msgs:/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(wam_common_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTCartPos.msg" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTCartPos.msg" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTCartVel.msg" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTCartVel.msg" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointPos.msg" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointPos.msg" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointTrq.msg" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointTrq.msg" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointVel.msg" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointVel.msg" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTOrtnPos.msg" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTOrtnPos.msg" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTOrtnVel.msg" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTOrtnVel.msg" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTPose.msg" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTPose.msg" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandFingerPos.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandFingerPos.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandFingerVel.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandFingerVel.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandGraspPos.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandGraspPos.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandGraspVel.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandGraspVel.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandSpreadPos.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandSpreadPos.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandSpreadVel.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandSpreadVel.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/CartPosMove.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/CartPosMove.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/ChangeMinirobot.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/ChangeMinirobot.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/CouplingWam.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/CouplingWam.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/DirMove.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/DirMove.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/GravityComp.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/GravityComp.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Hold.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Hold.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/IdleWam.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/IdleWam.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/JointMove.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/JointMove.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Move.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Move.srv" "std_msgs/Float32MultiArray:std_msgs/MultiArrayDimension:std_msgs/MultiArrayLayout:geometry_msgs/Point"
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/OrtnMove.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/OrtnMove.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Pose.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Pose.srv" "std_msgs/MultiArrayDimension:geometry_msgs/Pose:std_msgs/MultiArrayLayout:geometry_msgs/Quaternion:geometry_msgs/Point:std_msgs/Float32MultiArray"
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/PoseMove.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/PoseMove.srv" "geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/Point"
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Wrist.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Wrist.srv" ""
)

get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/WristRotate.srv" NAME_WE)
add_custom_target(_wam_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_common" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/WristRotate.srv" ""
)

#
#  langs = gencpp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTCartPos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_msg_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTCartVel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_msg_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointPos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_msg_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointTrq.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_msg_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointVel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_msg_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTOrtnPos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_msg_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTOrtnVel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_msg_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)

### Generating Services
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandFingerPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandFingerVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandGraspPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandGraspVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandSpreadPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandSpreadVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/CartPosMove.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/ChangeMinirobot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/CouplingWam.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/DirMove.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/GravityComp.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Hold.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/IdleWam.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/JointMove.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Move.srv"
  "${MSG_I_FLAGS}"
  "/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Float32MultiArray.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/OrtnMove.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Pose.srv"
  "${MSG_I_FLAGS}"
  "/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Pose.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Quaternion.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Point.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Float32MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/PoseMove.srv"
  "${MSG_I_FLAGS}"
  "/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Quaternion.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Pose.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Wrist.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)
_generate_srv_cpp(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/WristRotate.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
)

### Generating Module File
_generate_module_cpp(wam_common
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(wam_common_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(wam_common_generate_messages wam_common_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTCartPos.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTCartVel.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointPos.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointTrq.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointVel.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTOrtnPos.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTOrtnVel.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTPose.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandFingerPos.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandFingerVel.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandGraspPos.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandGraspVel.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandSpreadPos.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandSpreadVel.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/CartPosMove.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/ChangeMinirobot.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/CouplingWam.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/DirMove.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/GravityComp.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Hold.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/IdleWam.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/JointMove.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Move.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/OrtnMove.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Pose.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/PoseMove.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Wrist.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/WristRotate.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_cpp _wam_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wam_common_gencpp)
add_dependencies(wam_common_gencpp wam_common_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wam_common_generate_messages_cpp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTCartPos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_msg_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTCartVel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_msg_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointPos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_msg_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointTrq.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_msg_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointVel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_msg_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTOrtnPos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_msg_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTOrtnVel.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_msg_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTPose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)

### Generating Services
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandFingerPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandFingerVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandGraspPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandGraspVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandSpreadPos.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandSpreadVel.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/CartPosMove.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/ChangeMinirobot.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/CouplingWam.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/DirMove.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/GravityComp.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Hold.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/IdleWam.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/JointMove.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Move.srv"
  "${MSG_I_FLAGS}"
  "/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Float32MultiArray.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/OrtnMove.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Pose.srv"
  "${MSG_I_FLAGS}"
  "/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Pose.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Quaternion.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Point.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Float32MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/PoseMove.srv"
  "${MSG_I_FLAGS}"
  "/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Quaternion.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Pose.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Wrist.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)
_generate_srv_py(wam_common
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/WristRotate.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
)

### Generating Module File
_generate_module_py(wam_common
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(wam_common_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(wam_common_generate_messages wam_common_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTCartPos.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTCartVel.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointPos.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointTrq.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTJointVel.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTOrtnPos.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTOrtnVel.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/msg/RTPose.msg" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandFingerPos.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandFingerVel.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandGraspPos.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandGraspVel.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandSpreadPos.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/BHandSpreadVel.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/CartPosMove.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/ChangeMinirobot.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/CouplingWam.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/DirMove.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/GravityComp.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Hold.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/IdleWam.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/JointMove.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Move.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/OrtnMove.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Pose.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/PoseMove.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/Wrist.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_common/srv/WristRotate.srv" NAME_WE)
add_dependencies(wam_common_generate_messages_py _wam_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wam_common_genpy)
add_dependencies(wam_common_genpy wam_common_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wam_common_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_common
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(wam_common_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(wam_common_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(wam_common_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common)
  install(CODE "execute_process(COMMAND \"/home/wamremote/.matlab/R2022a/ros1/glnxa64/venv/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_common
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(wam_common_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(wam_common_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(wam_common_generate_messages_py std_msgs_generate_messages_py)
endif()
