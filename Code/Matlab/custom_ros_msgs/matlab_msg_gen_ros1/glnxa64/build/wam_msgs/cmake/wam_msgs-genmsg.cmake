# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "wam_msgs: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iwam_msgs:/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_msgs/msg;-Istd_msgs:/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg;-Igeometry_msgs:/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg;-Istd_msgs:/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(wam_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_msgs/msg/Location.msg" NAME_WE)
add_custom_target(_wam_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wam_msgs" "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_msgs/msg/Location.msg" "std_msgs/Header:geometry_msgs/Point"
)

#
#  langs = gencpp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(wam_msgs
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_msgs/msg/Location.msg"
  "${MSG_I_FLAGS}"
  "/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(wam_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(wam_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(wam_msgs_generate_messages wam_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_msgs/msg/Location.msg" NAME_WE)
add_dependencies(wam_msgs_generate_messages_cpp _wam_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wam_msgs_gencpp)
add_dependencies(wam_msgs_gencpp wam_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wam_msgs_generate_messages_cpp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(wam_msgs
  "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_msgs/msg/Location.msg"
  "${MSG_I_FLAGS}"
  "/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg/Header.msg;/usr/local/MATLAB/R2022a/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(wam_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(wam_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(wam_msgs_generate_messages wam_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wamremote/TFGjuanma/Code/Matlab/custom_ros_msgs/matlab_msg_gen_ros1/glnxa64/src/wam_msgs/msg/Location.msg" NAME_WE)
add_dependencies(wam_msgs_generate_messages_py _wam_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wam_msgs_genpy)
add_dependencies(wam_msgs_genpy wam_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wam_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wam_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(wam_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(wam_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(wam_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_msgs)
  install(CODE "execute_process(COMMAND \"/home/wamremote/.matlab/R2022a/ros1/glnxa64/venv/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wam_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(wam_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(wam_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(wam_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
