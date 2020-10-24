load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

cc_library(
    name = "rospack",
    srcs = glob(
        [
            "src/*.cpp",
            "src/*.h",
        ],
        exclude = [
            "src/rospack_main.cpp",
            "src/rosstack_main.cpp",
            "src/rospack_backcompat.cpp",
        ],
    ),
    hdrs = glob(["include/**/*.h"]),
    includes = ["include"],
    visibility = ["//visibility:public"],
    deps = [
        "@boost//:program_options",
        "@boost//:system",
        # "@tinyxml2",
    ],
)

cc_binary(
    name = "rospackexe",
    srcs = ["src/rospack_main.cpp"],
    includes = ["include"],
    visibility = ["//visibility:public"],
    deps = [":rospack"],
)

cc_binary(
    name = "rosstackexe",
    srcs = ["src/rosstack_main.cpp"],
    includes = ["include"],
    visibility = ["//visibility:public"],
    deps = [":rospack"],
)
