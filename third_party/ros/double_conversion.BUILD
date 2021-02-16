load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "double_conversion",
    srcs = glob(["usr/lib/x86_64-linux-gnu/libdouble_conversion.so*"]),
    hdrs = glob(["usr/include/double-conversion/**/*.h"]),
    includes = ["usr/include/double-conversion"],
    visibility = ["//visibility:public"],
)
