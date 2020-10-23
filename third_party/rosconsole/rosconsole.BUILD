load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "rosconsole",
    srcs = glob(
        ["src/**/*.cpp"],
        exclude = ["src/rosconsole/impl/rosconsole_log4cxx.cpp"],
    ),
    hdrs = glob(["include/**/*.h"]),
    includes = ["include"],
    visibility = ["//visibility:public"],
    deps = [
        "@boost//:regex",
        "@boost//:system",
        "@boost//:thread",
        "@glog",
        "@roscpp_core",
    ],
)
