load("@rules_python//python:defs.bzl", "py_binary", "py_library")

py_library(
    name = "rospkg",
    srcs = glob(["src/**/*.py"]),
    imports = ["src"],
    srcs_version = "PY3",
    visibility = ["//visibility:public"],
    deps = ["@ros_comm//:rosgraph_lib"],
)

genrule(
    name = "rosversion_py",
    srcs = ["scripts/rosversion"],
    outs = ["scripts/rosversion.py"],
    cmd = "cp -R `readlink -f $(SRCS)` $(OUTS)",
)

py_binary(
    name = "rosversion",
    srcs = [":rosversion_py"],
    main = ":rosversion_py",
    python_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":rospkg",
    ],
)
