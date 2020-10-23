load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "cpp_common",
    srcs = glob(["cpp_common/src/**/*.cpp"]),
    hdrs = glob(["cpp_common/include/**/*.h"]),
    includes = ["cpp_common/include"],
    visibility = ["//visibility:private"],
    deps = [
        "@boost//:filesystem",
        "@console_bridge",
    ],
)

cc_library(
    name = "rostime",
    hdrs = glob(["rostime/include/**/*.h"]),
    includes = ["rostime/include"],
    visibility = ["//visibility:private"],
    deps = [
        ":cpp_common",
        "@boost//:date_time",
        "@boost//:system",
        "@boost//:thread",
    ],
)

cc_library(
    name = "roscpp_traits",
    hdrs = glob(["roscpp_traits/include/**/*.h"]),
    includes = ["roscpp_traits/include"],
    visibility = ["//visibility:private"],
    deps = [
        ":cpp_common",
        ":rostime",
    ],
)

cc_library(
    name = "roscpp_serialization",
    srcs = glob(["roscpp_serialization/src/**/*.cpp"]),
    hdrs = glob(["roscpp_serialization/include/**/*.h"]),
    includes = ["roscpp_serialization/include"],
    visibility = ["//visibility:private"],
    deps = [
        ":cpp_common",
        ":roscpp_traits",
        ":rostime",
        "@boost//:array",
        "@boost//:call_traits",
        "@boost//:mpl",
        "@boost//:signals2",
    ],
)

cc_library(
    name = "roscpp_core",
    visibility = ["//visibility:public"],
    deps = [
        ":cpp_common",
        ":roscpp_serialization",
        ":roscpp_traits",
        ":rostime",
    ],
)
