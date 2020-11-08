load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("@pip_deps//:requirements.bzl", "requirement")

filegroup(
    name = "templates",
    srcs = [
        "scripts/msg.h.template",
        "scripts/srv.h.template",
    ],
)

py_library(
    name = "gencpp",
    srcs = glob(["src/**/*.py"]),
    imports = ["src"],
    srcs_version = "PY3",
    visibility = ["//visibility:public"],
)

py_binary(
    name = "gencpp_runner",
    srcs = glob(["scripts/*.py"]),
    data = [":templates"],
    main = "gen_cpp.py",
    python_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":gencpp",
        "@genmsg_archive//:genmsg",
        requirement("empy"),
    ],
)
