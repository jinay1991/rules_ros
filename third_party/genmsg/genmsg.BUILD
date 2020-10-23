load("@rules_python//python:defs.bzl", "py_binary")

py_binary(
    name = "genmsg",
    srcs = glob(["src/**/*.py"]),
    imports = ["src"],
    visibility = ["//visibility:public"],
)
