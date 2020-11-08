load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def pluginlib():
    """ Load pluginlib as Dependency """
    if "pluginlib" not in native.existing_rules():
        http_archive(
            name = "pluginlib",
            sha256 = "9cfa635dc4d3f7fa7e448d092927cb7ea7876e8d9a874d6d76c13e5e4341e9d4",
            strip_prefix = "pluginlib-4.1.1",
            build_file = "//third_party/pluginlib:pluginlib.BUILD",
            url = "https://github.com/ros/pluginlib/archive/4.1.1.tar.gz",
        )
