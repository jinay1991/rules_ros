load("@rules_cc//cc:defs.bzl", "cc_test")

cc_test(
    name = "unit_tests",
    srcs = ["ros_test.cpp"],
    deps = [
        "@googletest//:gtest",
        "@ros_comm//:roscpp",
    ],
)
