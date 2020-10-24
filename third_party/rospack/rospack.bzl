load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def rospack():
    """ Load rospack as Dependency """
    if "rospack" not in native.existing_rules():
        http_archive(
            name = "rospack",
            sha256 = "85e2cb33ada71eb67d26e84c149f8a5812f9a6e6a1329e4923b95ae74921613a",
            strip_prefix = "rospack-2.6.2",
            build_file = "//third_party/rospack:rospack.BUILD",
            url = "https://github.com/ros/rospack/archive/2.6.2.tar.gz",
        )
