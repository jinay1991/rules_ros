load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def genpy():
    """ Load genpy as Dependency """
    if "genpy_archive" not in native.existing_rules():
        http_archive(
            name = "genpy_archive",
            sha256 = "523d20068171ce7e5b4c453eba7976aafa819e6b5af806ffdf6bc1d7a1dfc2a8",
            strip_prefix = "genpy-0.6.14",
            build_file = "//third_party/genpy:genpy.BUILD",
            url = "https://github.com/ros/genpy/archive/0.6.14.tar.gz",
        )
