load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "json",
    srcs = glob(["usr/lib/x86_64-linux-gnu/libPocoJson.so*"]),
    hdrs = glob(["usr/include/Poco/JSON/*.h"]),
    includes = ["usr/include"],
    visibility = ["//visibility:public"],
    deps = [
        ":foundation",
    ],
)

cc_library(
    name = "foundation",
    srcs = glob(["usr/lib/x86_64-linux-gnu/libPocoFoundation.so*"]),
    hdrs = glob(["usr/include/Poco/Foundation/*.h"]),
    includes = ["usr/include"],
    visibility = ["//visibility:public"],
)
