load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def genmsg():
    """ Load genmsg as Dependency """
    if "genmsg_archive" not in native.existing_rules():
        http_archive(
            name = "genmsg_archive",
            sha256 = "0e414846823a2aaa7781f81268251c7c9a45ff96cef8e6a78bbbbcf7e4c28d56",
            strip_prefix = "genmsg-0.5.16",
            build_file = "//third_party/genmsg:genmsg.BUILD",
            url = "https://github.com/ros/genmsg/archive/0.5.16.tar.gz",
        )
