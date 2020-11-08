load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def rospkg():
    """ Load rospkg as Dependency """
    if "rospkg" not in native.existing_rules():
        http_archive(
            name = "rospkg",
            sha256 = "39e801b104e4c31ddc60a0c1a526197429cfbbe72b574a3cad851e624ff54249",
            strip_prefix = "rospkg-1.2.8",
            build_file = "//third_party/rospkg:rospkg.BUILD",
            url = "https://github.com/ros-infrastructure/rospkg/archive/1.2.8.tar.gz",
        )
