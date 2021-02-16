load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "class_loader",
    srcs = [
        "src/class_loader.cpp",
        "src/class_loader_core.cpp",
        "src/meta_object.cpp",
        "src/multi_library_class_loader.cpp",
    ],
    hdrs = [
        "include/class_loader/class_loader.hpp",
        "include/class_loader/class_loader_core.hpp",
        "include/class_loader/exceptions.hpp",
        "include/class_loader/meta_object.hpp",
        "include/class_loader/multi_library_class_loader.hpp",
        "include/class_loader/register_macro.hpp",
        "include/class_loader/visibility_control.hpp",
    ],
    includes = ["include"],
    visibility = ["//visibility:public"],
    deps = [
        "@boost//:system",
        "@boost//:thread",
        "@console_bridge",
        "@poco//:foundation",
    ],
)
