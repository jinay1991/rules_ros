load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "roslib",
    srcs = glob(["core/roslib/src/*.cpp"]),
    hdrs = glob(["core/roslib/include/**/*.h"]),
    includes = ["core/roslib/include"],
    linkopts = ["-lrt"],
    visibility = ["//visibility:public"],
    deps = [
        "@boost//:thread",
        "@rospack",
    ],
)

py_library(
    name = "gendep",
    srcs = glob(["core/roslib/src/**/*.py"]),
    imports = ["src"],
)

py_binary(
    name = "gendep_runner",
    srcs = glob(["core/roslib/scripts/*"]),
    main = "gendep",
    visibility = ["//visibility:public"],
    deps = [
        ":gendep",
    ],
)
