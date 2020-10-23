load("@rules_cc//cc:defs.bzl", "cc_library")

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
        "@boost//:scope_exit",
        "@boost//:thread",
        "@ros_comm_msgs//:builtin_ros_comm_msgs",
        "@rosconsole",
        "@roscpp_core",
    ],
)

cc_library(
    name = "xmlrpcpp",
    srcs = glob(["utilities/xmlrpcpp/src/*.cpp"]),
    hdrs = glob(["utilities/xmlrpcpp/include/**/*.h"]),
    includes = ["utilities/xmlrpcpp/include"],
    visibility = ["//visibility:public"],
    deps = [
        "@roscpp_core",
    ],
)
