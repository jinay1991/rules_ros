load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "foundation",
    srcs = glob(["usr/lib/x86_64-linux-gnu/libPocoFoundation.so*"]),
    hdrs = glob(["usr/include/Poco/Foundation/*.h"]),
    includes = ["usr/include/Poco"],
    visibility = ["//visibility:public"],
    deps = [
        "@double_conversion",
    ],
)
