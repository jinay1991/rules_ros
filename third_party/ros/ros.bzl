load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def ros():
    """ Load ros as Dependency """
    if "ros" not in native.existing_rules():
        http_archive(
            name = "ros",
            sha256 = "7a1e729de9be807862b6ed721475fec74583f6dc0c06b233b06b1b9fda31291e",
            strip_prefix = "ros-1.15.7",
            build_file = "//third_party/ros:ros.BUILD",
            url = "https://github.com/ros/ros/archive/1.15.7.tar.gz",
        )
