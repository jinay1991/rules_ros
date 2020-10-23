load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def ros_comm():
    """ Load ros_comm as Dependency """
    if "ros_comm" not in native.existing_rules():
        http_archive(
            name = "ros_comm",
            sha256 = "b3b75612feb447afe70600e3ba80bf3e356493a058ba8ebf2746e8db0c55165c",
            strip_prefix = "ros_comm-1.14.10",
            build_file = "//third_party/ros_comm:ros_comm.BUILD",
            url = "https://github.com/ros/ros_comm/archive/1.14.10.tar.gz",
        )
