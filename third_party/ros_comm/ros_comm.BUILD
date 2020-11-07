load("@rules_cc//cc:defs.bzl", "cc_library")
load("@rules_ros//tools:message_generation.bzl", "generate_messages")
load("@rules_ros//tools:service_generation.bzl", "generate_services")

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
        ":xmlrpcpp",
        "@boost//:chrono",
        "@boost//:filesystem",
        "@boost//:scope_exit",
        "@boost//:system",
        "@boost//:thread",
        "@ros_comm//:builtin_ros_comm_msgs_srv",
        "@ros_comm//:builtin_ros_comm_msgs_whatever",
        "@ros_comm_msgs//:builtin_ros_comm_msgs",
        "@rosconsole",
        "@roscpp_core",
    ],
)

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
