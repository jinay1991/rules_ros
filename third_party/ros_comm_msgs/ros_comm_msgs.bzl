load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def ros_comm_msgs():
    """ Load ros_comm_msgs as Dependency """
    if "ros_comm_msgs" not in native.existing_rules():
        http_archive(
            name = "ros_comm_msgs",
            sha256 = "5b8b91e8671d03ea84ba32a3ea7360bc4594655e7ba3ec6677a984f393aaafbd",
            strip_prefix = "ros_comm_msgs-1.11.3",
            build_file = "//third_party/ros_comm_msgs:ros_comm_msgs.BUILD",
            url = "https://github.com/ros/ros_comm_msgs/archive/1.11.3.tar.gz",
        )
