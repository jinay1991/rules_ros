# rules_ros

Bazel rules for consuming `ros` (`noetic` - `Ubuntu 20.04`)

# Status

ROS Components list (Available/Not Available)


### Host independent Dependencies

- [x] catkin
- [x] class_loader
- [x] common_msgs
- [x] console_bridge
- [x] gencpp
- [x] genmsg
- [x] genpy
- [x] message_runtime
- [x] pluginlib
- [x] ros_comm_msg
    - [x] rosgraph_msg
- [x] ros_comm
    - [x] roscpp
    - [x] xmlrpcpp
- [x] ros
- [x] rosconsole
- [x] roscpp_core
    - [x] cpp_common
    - [x] rostime
    - [x] ros_serialization
    - [x] ros_traits
- [x] rospkg
- [x] std_msgs

### Transitive Depenendencies 

- [x] double_conversion
- [x] poco

### Other Depenendencies 

- [x] boost
- [x] bzip2
- [x] glog
- [x] googletest
- [x] lzma
- [x] qt
- [x] zlib
- [x] zstd

# Reference

https://github.com/nicolov/ros-bazel