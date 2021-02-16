load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
    name = "talker",
    srcs = ["talker.cpp"],
    visibility = ["//visibility:public"],
    deps = [
        "@ros//ros_comm/:roscpp",
    ],
)

cc_binary(
    name = "listener",
    srcs = ["listener.cpp"],
    visibility = ["//visibility:public"],
    deps = [
        "@class_loader",
        "@ros//ros_comm:roscpp",
    ],
)
