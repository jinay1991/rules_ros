load("@rules_ros//tools:message_generation.bzl", "generate_messages")

package(default_visibility = ["//visibility:public"])

generate_messages(
    name = "builtin_rosgraph_msgs",
    srcs = glob(["rosgraph_msgs/**/*.msg"]),
    ros_package_name = "rosgraph_msgs",
    deps = ["@std_msgs//:generate_header"],
)
