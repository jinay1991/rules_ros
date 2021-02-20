load("@rules_cc//cc:defs.bzl", "cc_library")
load("@rules_ros//tools:message_generation.bzl", "generate_messages")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "builtin_std_msgs",
    hdrs = glob(["include/**/*.h"]),
    deps = [":generate_header"],
)

generate_messages(
    name = "generate_header",
    srcs = glob(["msg/*.msg"]),
    ros_package_name = "std_msgs",
)
