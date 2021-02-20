load("@rules_python//python:defs.bzl", "py_binary")
load("@rules_ros//tools:message_generation.bzl", "generate_messages")
load("@rules_ros//tools:service_generation.bzl", "generate_services")

package(default_visibility = ["//visibility:public"])

# actionlib_msgs
generate_messages(
    name = "actionlib_msgs",
    srcs = glob([
        "actionlib_msgs/**/*.msg",
    ]),
    ros_package_name = "actionlib_msgs",
    deps = [
        "@message_runtime",
        "@std_msgs",
    ],
)

generate_services(
    name = "actionlib_srv",
    srcs = glob([
        "actionlib_msgs/**/*.srv",
    ]),
    ros_package_name = "actionlib_msgs",
    deps = [
        "@message_runtime",
        "@std_msgs",
    ],
)

py_binary(
    name = "genaction",
    srcs = ["scripts/genaction.py"],
    main = "genaction.py",
    python_version = "PY3",
)

filegroup(
    name = "actionlib_msgs_package_xml",
    srcs = "actionlib_msgs/package.xml",
)

# common_msgs
filegroup(
    name = "common_msgs_package_xml",
    srcs = "common_msgs/package.xml",
)

# diagnostic_msgs
generate_messages(
    name = "diagnostic_msgs",
    srcs = glob([
        "diagnostic_msgs/**/*.msg",
    ]),
    ros_package_name = "diagnostic_msgs",
    deps = [
        "@message_runtime",
        "@std_msgs",
    ],
)

generate_services(
    name = "diagnostic_srv",
    srcs = glob([
        "diagnostic_msgs/**/*.srv",
    ]),
    ros_package_name = "diagnostic_msgs",
    deps = [
        "@message_runtime",
        "@std_msgs",
    ],
)

filegroup(
    name = "diagnostic_msgs_package_xml",
    srcs = "diagnostic_msgs/package.xml",
)

# geometry_msgs
generate_messages(
    name = "geometry_msgs",
    srcs = glob([
        "geometry_msgs/**/*.msg",
        "geometry_msgs/**/*.srv",
    ]),
    ros_package_name = "geometry_msgs",
    deps = [
        "@message_runtime",
        "@std_msgs",
    ],
)

filegroup(
    name = "geometry_msgs_package_xml",
    srcs = "geometry_msgs/package.xml",
)

# nav_msgs
generate_messages(
    name = "nav_msgs",
    srcs = glob([
        "nav_msgs/**/*.msg",
    ]),
    ros_package_name = "nav_msgs",
    deps = [
        ":actionlib_msgs",
        ":geometry_msgs",
        "@message_runtime",
        "@std_msgs",
    ],
)

generate_services(
    name = "nav_srv",
    srcs = glob([
        "nav_msgs/**/*.srv",
    ]),
    ros_package_name = "nav_msgs",
    deps = [
        ":actionlib_msgs",
        ":geometry_msgs",
        "@message_runtime",
        "@std_msgs",
    ],
)

filegroup(
    name = "nav_msgs_package_xml",
    srcs = "nav_msgs/package.xml",
)

# sensor_msgs
generate_messages(
    name = "sensor_msgs",
    srcs = glob([
        "sensor_msgs/**/*.msg",
    ]),
    ros_package_name = "sensor_msgs",
    deps = [
        ":geometry_msgs",
        "@message_runtime",
        "@std_msgs",
    ],
)

generate_messages(
    name = "sensor_srv",
    srcs = glob([
        "sensor_msgs/**/*.srv",
    ]),
    ros_package_name = "sensor_msgs",
    deps = [
        ":geometry_msgs",
        "@message_runtime",
        "@std_msgs",
    ],
)

# generate_action(
#     name = "sensor_action",
# )

filegroup(
    name = "sensor_msgs_package_xml",
    srcs = "sensor_msg/package.xml",
)

# shape_msgs
generate_messages(
    name = "shape_msgs",
    srcs = glob([
        "shape_msgs/**/*.msg",
    ]),
    ros_package_name = "shape_msgs",
    deps = [
        ":geometry_msgs",
        "@message_runtime",
        "@std_msgs",
    ],
)

filegroup(
    name = "shape_msgs_package_xml",
    srcs = "shape_msgs/package.xml",
)

# stereo_msgs
generate_messages(
    name = "stereo_msgs",
    srcs = glob([
        "stereo_msgs/**/*.msg",
    ]),
    deps = [
        ":sensor_msgs",
        "@message_runtime",
        "@std_msgs",
    ],
)

filegroup(
    name = "stereo_msgs_package_xml",
    srcs = "stereo_msgs/package.xml",
)

# trajectory_msgs
generate_messages(
    name = "trajectory_msgs",
    srcs = glob([
        "trajectory_msgs/**/*.msg",
        "trajectory_msgs/**/*.srv",
    ]),
    ros_package_name = "trajectory_msgs",
    deps = [
        ":geometry_msgs",
        "@message_runtime",
        "@std_msgs",
    ],
)

filegroup(
    name = "trajectory_msgs_package_xml",
    srcs = "trajectory_msgs/package.xml",
)

# visualization_msgs
generate_messages(
    name = "visualization_msgs",
    srcs = glob([
        "visualization_msgs/**/*.msg",
        "visualization_msgs/**/*.srv",
    ]),
    ros_package_name = "visualization_msgs",
    deps = [
        ":geometry_msgs",
        "@message_runtime",
        "@std_msgs",
    ],
)

filegroup(
    name = "visualization_msgs_package_xml",
    srcs = "visualization_msgs/package.xml",
)
