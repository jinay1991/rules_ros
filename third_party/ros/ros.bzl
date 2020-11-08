load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def ros():
    """ Load ros as Dependency """
    if "ros" not in native.existing_rules():
        http_archive(
            name = "ros",
            sha256 = "2ff175a9bb2b1849f12a6bf972ce7e4313d543a2bbc83b60fdae7db6e0ba353f",
            strip_prefix = "ros-1.0.1",
            build_file = "//third_party/ros:ros.BUILD",
            url = "https://github.com/ros/ros/archive/1.0.1.tar.gz",
        )
