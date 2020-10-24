load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "rosconsole",
    srcs = [
        "src/rosconsole/impl/rosconsole_print.cpp",
        "src/rosconsole/rosconsole.cpp",
        "src/rosconsole/rosconsole_backend.cpp",
    ],
    hdrs = glob(["include/**/*.h"]),
    includes = ["include"],
    visibility = ["//visibility:public"],
    deps = [
        "@boost//:regex",
        "@boost//:system",
        "@boost//:thread",
        "@glog",
        "@roscpp_core//:cpp_common",
        "@roscpp_core//:rostime",
    ],
)
