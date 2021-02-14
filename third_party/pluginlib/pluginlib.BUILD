load("@rules_python//python:defs.bzl", "py_binary")
load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "pluginlib",
    hdrs = glob(["pluginlib/include/pluginlib/**/*.h*"]),
    includes = ["pluginlib/include"],
    visibility = ["//visibility:public"],
    deps = [
        "@boost//:filesystem",
        "@class_loader",
        "@ros//:roslib",
        "@rosconsole",
    ],
)

py_binary(
    name = "pluginlib_header_migration",
    srcs = ["scripts/pluginlib_headers_migration.py"],
    imports = ["scripts"],
    main = "scripts/pluginlib_headers_migration.py",
    srcs_version = "PY3",
)
