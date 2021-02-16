load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def class_loader():
    """ Load class_loader as Dependency """
    if "class_loader" not in native.existing_rules():
        http_archive(
            name = "class_loader",
            sha256 = "9ac308d44c746032c4dfd50516de5f0b3aa18bc29013dc3682b29495cd6a83d9",
            strip_prefix = "class_loader-1.4.1",
            build_file = "//third_party/class_loader:class_loader.BUILD",
            url = "https://github.com/ros/class_loader/archive/1.4.1.tar.gz",
        )
