load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def roscpp_core():
    """ Load roscpp_core as Dependency """
    if "roscpp_core" not in native.existing_rules():
        http_archive(
            name = "roscpp_core",
            sha256 = "d5a0ad09fa878d9f3d6d7f3e8c7854f0f160aeeea9c4d332e3dc87552087ca68",
            strip_prefix = "roscpp_core-0.6.14",
            build_file = "//third_party/roscpp_core:roscpp_core.BUILD",
            url = "https://github.com/ros/roscpp_core/archive/0.6.14.tar.gz",
        )
