load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("@pip_deps//:requirements.bzl", "requirement")

py_library(
    name = "genpy",
    srcs = glob(["src/**/*.py"]),
    imports = ["src"],
    srcs_version = "PY3",
    visibility = ["//visibility:public"],
)

py_binary(
    name = "genmsgpy_runner",
    srcs = glob(["scripts/*.py"]),
    main = "genmsg_py.py",
    visibility = ["//visibility:public"],
    deps = [
        ":genpy",
        "@genmsg_archive//:genmsg",
        requirement("empy"),
    ],
)

py_binary(
    name = "gensrvpy_runner",
    srcs = glob(["scripts/*.py"]),
    main = "gensrv_py.py",
    visibility = ["//visibility:public"],
    deps = [
        ":genpy",
        "@genmsg_archive//:genmsg",
        requirement("empy"),
    ],
)
