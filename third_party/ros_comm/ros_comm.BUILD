load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")
load("@rules_ros//tools:message_generation.bzl", "generate_messages")
load("@rules_ros//tools:service_generation.bzl", "generate_services")

####################
# Clients
####################

genrule(
    name = "generate_ros_common",
    srcs = ["clients/roscpp/include/ros/common.h.in"],
    outs = ["clients/roscpp/include/ros/common.h"],
    cmd = "sed -e 's/@roscpp_VERSION_MAJOR@/0/g' \
               -e 's/@roscpp_VERSION_MAJOR@/1/g' \
               -e 's/@roscpp_VERSION_MAJOR@/2/g' \
               $(SRCS) > $(OUTS)",
)

genrule(
    name = "generate_config",
    srcs = ["clients/roscpp/src/libros/config.h.in"],
    outs = ["clients/roscpp/src/libros/config.h"],
    cmd = "sed -e 's/#cmakedefine HAVE_IFADDRS_H/#define HAVE_IFADDRS_H 1/g' \
               -e 's/#cmakedefine HAVE_TRUNC//g' \
               -e 's/#cmakedefine HAVE_EPOLL//g' \
               $(SRCS) > $(OUTS)",
)

generate_messages(
    name = "builtin_ros_comm_msgs_whatever",
    srcs = glob(["clients/roscpp/msg/*.msg"]),
    ros_package_name = "roscpp",
)

generate_services(
    name = "builtin_ros_comm_msgs_srv",
    srcs = glob(["clients/roscpp/srv/*.srv"]),
    ros_package_name = "roscpp",
    deps = ["@ros_comm//:builtin_ros_comm_msgs_whatever"],
)

cc_library(
    name = "roscpp",
    srcs = glob(["clients/roscpp/src/libros/**/*.cpp"]) + [":generate_config"],
    hdrs = glob(["clients/roscpp/include/**/*.h"]) + [":generate_ros_common"],
    includes = [
        "clients/roscpp/include",
        "clients/roscpp/include/ros",
        "clients/roscpp/src/libros",
    ],
    linkopts = ["-lm"],
    visibility = ["//visibility:public"],
    deps = [
        ":builtin_ros_comm_msgs_srv",
        ":builtin_ros_comm_msgs_whatever",
        ":xmlrpcpp",
        "@boost//:chrono",
        "@boost//:filesystem",
        "@boost//:scope_exit",
        "@boost//:system",
        "@boost//:thread",
        "@ros_comm_msgs//:builtin_rosgraph_msgs",
        "@rosconsole",
        "@roscpp_core",
    ],
)

py_library(
    name = "rospy",
    srcs = glob(["clients/rospy/src/rospy/**/*.py"]),
    imports = ["clients/rospy/src"],
    srcs_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":roscpp_msgs_py",
        ":rosgraph_lib",
        "@ros_comm_msgs//:builtin_rosgraph_msgs",
        "@roslib",
        "@std_msgs//:builtin_std_msgs",
    ],
)

####################
# Tools
####################

# rosbag
cc_library(
    name = "rosbag_cpp_lib",
    srcs = glob(["tools/rosbag/src/**/*.cpp"]),
    hdrs = glob(["tools/rosbag/include/**/*.h"]),
    includes = ["tools/rosbag/include"],
    visibility = ["//visibility:public"],
    deps = [":roscpp"],
)

py_library(
    name = "rosbag_py_lib",
    srcs = glob(["tools/rosbag/src/**/*.py"]),
    imports = ["tools/rosbag/src"],
    srcs_version = "PY3",
    deps = [
        ":rospy",
        "@genmsg",
        "@genpy",
        "@ros_comm_msgs//:builtin_rosgraph_msgs",
        "@roslib",
        "@rospkg",
        "@std_msgs//:builtin_std_msgs",
    ],
)

genrule(
    name = "rosbag_py",
    srcs = ["tools/rosbag/src/rosbag"],
    outs = ["tools/rosbag/src/rosbag_.py"],
    cmd = "cp -R `readlink -f $(SRCS)` $(OUTS)",
)

py_binary(
    name = "rosbag",
    srcs = [":rosbag_py"],
    main = ":rosbag_py",
    python_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":rosbag_py_lib",
    ],
)

# rosbag_storage
cc_library(
    name = "rosbag_storage_cpp_lib",
    srcs = glob(["tools/rosbag_storage/**/*.cpp"]),
    hdrs = glob(["tools/rosbag_storage/**/*.h"]),
    includes = ["tools/rosbag_storage/include"],
    visibility = ["//visibility:public"],
    deps = [
        "@boost//:filesystem",
        "@console_bridge",
        "@roscpp_core//:cpp_common",
        "@roscpp_core//:roscpp_serialization",
        "@roscpp_core//:roscpp_traits",
        "@roscpp_core//:rostime",
        "@std_msgs//:builtin_std_msgs",
    ],
)

# rosgraph
py_library(
    name = "rosgraph_lib",
    srcs = glob(["tools/rosgraph/src/**/*.py"]),
    data = ["tools/rosgraph/srcs"],
    imports = ["tools/rosgraph/src"],
    srcs_version = "PY3",
)

genrule(
    name = "rosgraph_py",
    srcs = ["tools/rosgraph/src/rosgraph"],
    outs = ["tools/rosgraph/src/rosgraph_.py"],
    cmd = "cp -R `readlink -f $(SRCS)` $(OUTS)",
)

py_binary(
    name = "rosgraph",
    srcs = [":rosgraph_py"],
    main = ":rosgraph_py",
    python_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":rosgraph_lib",
        "@rospkg",
    ],
)

# roslaunch
py_library(
    name = "roslaunch_lib",
    srcs = glob(["tools/roslaunch/src/**/*.py"]),
    imports = ["tools/roslaunch/src"],
    srcs_version = "PY3",
    deps = [
        ":rosparam_lib",
        "@ros_comm_msgs//:builtin_rosgraph_msgs",
        "@roslib",
    ],
)

genrule(
    name = "roslaunch_py",
    srcs = ["tools/roslaunch/src/roslaunch"],
    outs = ["tools/roslaunch/src/roslaunch_.py"],
    cmd = "cp -R `readlink -f $(SRCS)` $(OUTS)",
)

py_binary(
    name = "roslaunch",
    srcs = [":roslaunch_py"],
    main = ":roslaunch_py",
    python_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":roslaunch_lib",
        ":rosmaster_lib",
        "@rospkg",
    ],
)

# roscore
genrule(
    name = "roscore_py",
    srcs = ["tools/roslaunch/src/roscore"],
    outs = ["tools/roslaunch/src/roscore.py"],
    cmd = "cp -R `readlink -f $(SRCS)` $(OUTS)",
)

py_binary(
    name = "roscore",
    srcs = [":roscore_py"],
    data = [
        ":roslaunch_assets",
        ":roslaunch_binary",
        ":rosmaster",
        ":rosout_binary",
        "@rospkg//:rosversion",
    ],
    main = ":roscore_py",
    python_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":roslaunch_lib",
        ":rosmaster_lib",
    ],
)

# rosmaster
py_library(
    name = "rosmaster_lib",
    srcs = glob(["tools/rosmaster/src/**/*.py"]),
    imports = ["tools/rosmaster/src"],
    srcs_version = "PY3",
    deps = [
        "@rospkg",
    ],
)

genrule(
    name = "rosmaster_py",
    srcs = ["tools/rosmaster/src/rosmaster"],
    outs = ["tools/rosmaster/src/rosmaster_.py"],
    cmd = "cp -R `readlink -f $(SRCS)` $(OUTS)",
)

py_binary(
    name = "rosmaster",
    srcs = [":rosmaster_py"],
    main = ":rosmaster_py",
    python_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":rosmaster_lib",
    ],
)

# rosmsg
py_library(
    name = "rosmsg_lib",
    srcs = glob(["tools/rosmsg/src/**/*.py"]),
    imports = ["tools/rosmsg/src"],
    srcs_version = "PY3",
    deps = [
        ":rosbag_py_lib",
    ],
)

genrule(
    name = "rosmsg_py",
    srcs = ["tools/rosmsg/src/rosmsg"],
    outs = ["tools/rosmsg/src/rosmsg_.py"],
    cmd = "cp -R `readlink -f $(SRCS)` $(OUTS)",
)

py_binary(
    name = "rosmsg",
    srcs = [":rosmsg_py"],
    main = ":rosmsg_py",
    python_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":rosmsg_lib",
    ],
)

# rosnode
py_library(
    name = "rosnode_lib",
    srcs = glob(["tools/rosnode/src/**/*.py"]),
    imports = ["tools/rosnode/src"],
    srcs_version = "PY3",
    deps = [
        ":rostopic_lib",
    ],
)

genrule(
    name = "rosnode_py",
    srcs = ["tools/rosnode/src/rosnode"],
    outs = ["tools/rosnode/src/rosnode_.py"],
    cmd = "cp -R `readlink -f $(SRCS)` $(OUTS)",
)

py_binary(
    name = "rosnode",
    srcs = [":rosnode_py"],
    main = ":rosnode_py",
    python_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":rosnode_lib",
    ],
)

# rosout
cc_binary(
    name = "rosout",
    srcs = ["tools/rosout/rosout.cpp"],
    visibility = ["//visibility:public"],
    deps = [":roscpp"],
)

# rosparam
py_library(
    name = "rosparam_lib",
    srcs = glob(["tools/rosparam/src/**/*.py"]),
    imports = ["tools/rosparam/src"],
    srcs_version = "PY3",
)

genrule(
    name = "rosparam_py",
    srcs = ["tools/rosparam/src/rosparam"],
    outs = ["tools/rosparam/src/rosparam_.py"],
    cmd = "cp -R `readlink -f $(SRCS)` $(OUTS)",
)

py_binary(
    name = "rosservice",
    srcs = [":rosparam_py"],
    main = ":rosparam_py",
    python_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":rosparam_lib",
    ],
)

# rosservice
py_library(
    name = "rosservice_lib",
    srcs = glob(["tools/rosservice/src/**/*.py"]),
    imports = ["tools/rosservice/src"],
    srcs_version = "PY3",
    deps = [
        ":rosmsg",
    ],
)

genrule(
    name = "rosservice_py",
    srcs = ["tools/rosnode/src/rosnode"],
    outs = ["tools/rosnode/src/rosnode_.py"],
    cmd = "cp -R `readlink -f $(SRCS)` $(OUTS)",
)

py_binary(
    name = "rosservice",
    srcs = [":rosservice_py"],
    main = ":rosservice_py",
    python_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":rosservice_lib",
    ],
)

# rostest
py_library(
    name = "rostest_lib",
    srcs = glob(["tools/rostest/src/**/*.py"]),
    imports = ["tools/rostest/src"],
    srcs_version = "PY3",
    deps = [
        ":rosgraph_lib",
        ":roslaunch_lib",
        ":rosmaster_lib",
        ":rosmsg_lib",
        ":rospy",
        "@rosunit",
    ],
)

genrule(
    name = "rostest_py",
    srcs = ["tools/rostest/src/rostest"],
    outs = ["tools/rostest/src/rostest_.py"],
    cmd = "cp -R `readlink -f $(SRCS)` $(OUTS)",
)

py_binary(
    name = "rostest",
    srcs = [":rostest_py"],
    main = ":rostest_py",
    python_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":rostest_lib",
    ],
)

# rostopic
py_library(
    name = "rostopic_lib",
    srcs = glob(["tools/rostopic/src/**/*.py"]),
    imports = ["tools/rostopic/src"],
    srcs_version = "PY3",
    deps = [
        ":rosbag_py_lib",
    ],
)

genrule(
    name = "rostopic_py",
    srcs = ["tools/rostopic/src/rostopic"],
    outs = ["tools/rostopic/src/rostopic_.py"],
    cmd = "cp -R `readlink -f $(SRCS)` $(OUTS)",
)

py_binary(
    name = "rostopic",
    srcs = [":rostopic_py"],
    main = ":rostopic_py",
    python_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":rostopic_lib",
    ],
)

####################
# Utilities
####################

cc_library(
    name = "xmlrpcpp",
    srcs = glob([
        "utilities/xmlrpcpp/src/*.cpp",
        "utilities/xmlrpcpp/libb64/src/*.c",
    ]),
    hdrs = glob([
        "utilities/xmlrpcpp/include/**/*.h",
        "utilities/xmlrpcpp/libb64/include/**/*.h",
    ]),
    includes = [
        "utilities/xmlrpcpp/include",
        "utilities/xmlrpcpp/libb64/include",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "@roscpp_core//:cpp_common",
        "@roscpp_core//:rostime",
    ],
)
