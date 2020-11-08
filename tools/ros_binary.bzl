load("@rules_cc//cc:defs.bzl", "cc_binary")

def ros_binary(
        name,
        srcs = None,
        hdrs = None,
        ros_package_name = None,
        deps = None):
    """
    Generates ROS Binary (aka Node).

    Args:
        name:name
        srcs:srcs
        hdrs:hdrs
        ros_package_name:ros_package_name
        deps:deps
    Returns:
        A Bazel Target for ROS Node
    """
    if not srcs and not hdrs:
        fail("srcs or hdrs is required.")
    if not ros_package_name:
        fail("ros_package_name is required.")

    _ros_binary(
        name = name,
        srcs = srcs,
        ros_package_name = ros_package_name,
        outs = outs,
    )
    return cc_binary(
        name = name,
        srcs = srcs,
        hdrs = hdrs,
        includes = [""],
        deps = deps,
    )
