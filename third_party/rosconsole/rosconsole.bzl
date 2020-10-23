load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def rosconsole():
    """ Load rosconsole as Dependency """
    if "rosconsole" not in native.existing_rules():
        http_archive(
            name = "rosconsole",
            sha256 = "0b2cbc4f9a92466c0fbae7863482b286ef87692de4941527cb429e6c74639246",
            strip_prefix = "rosconsole-1.14.3",
            build_file = "//third_party/rosconsole:rosconsole.BUILD",
            url = "https://github.com/ros/rosconsole/archive/1.14.3.tar.gz",
        )
