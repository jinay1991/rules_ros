load("@rules_python//python:defs.bzl", "py_library")

py_library(
    name = "rosclean",
    srcs = glob(["tools/rosclean/src/**/*.py"]),
    imports = ["tools/rosclean/src"],
    srcs_version = "PY3",
    visibility = ["//visibility:public"],
)

py_library(
    name = "rosunit",
    srcs = glob(["tools/rosunit/src/**/*.py"]),
    imports = ["tools/rosunit/src"],
    srcs_version = "PY3",
    visibility = ["//visibility:public"],
)

py_library(
    name = "roslib",
    srcs = glob(["core/roslib/src/**/*.py"]),
    imports = ["core/roslib/src"],
    visibility = ["//visibility:public"],
    deps = [
        ":rosclean",
        "@rospkg",
    ],
)
