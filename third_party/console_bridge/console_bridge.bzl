load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def console_bridge():
    """ Load console_bridge as Dependency """
    if "console_bridge" not in native.existing_rules():
        http_archive(
            name = "console_bridge",
            sha256 = "2ff175a9bb2b1849f12a6bf972ce7e4313d543a2bbc83b60fdae7db6e0ba353f",
            strip_prefix = "console_bridge-1.0.1",
            build_file = "//third_party/console_bridge:console_bridge.BUILD",
            url = "https://github.com/ros/console_bridge/archive/1.0.1.tar.gz",
        )
