load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def class_loader():
    """ Load class_loader as Dependency """
    if "class_loader" not in native.existing_rules():
        http_archive(
            name = "class_loader",
            sha256 = "b35694031e34cb8f195a20ea88de5a4d8a13deae19e1f98b61abb5ac710e6a84",
            strip_prefix = "class_loader-2.0.1",
            build_file = "//third_party/class_loader:class_loader.BUILD",
            url = "https://github.com/ros/class_loader/archive/2.0.1.tar.gz",
        )
