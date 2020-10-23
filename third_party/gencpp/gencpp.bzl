load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def gencpp():
    """ Load gencpp as Dependency """
    if "gencpp_archive" not in native.existing_rules():
        http_archive(
            name = "gencpp_archive",
            sha256 = "05acfeeb1bbc374356bf7674fee2a7aab3bf6a48ebad4a06fd0f0d4455a60720",
            strip_prefix = "gencpp-0.6.5",
            build_file = "//third_party/gencpp:gencpp.BUILD",
            url = "https://github.com/ros/gencpp/archive/0.6.5.tar.gz",
        )
