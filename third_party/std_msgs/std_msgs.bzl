load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def std_msgs():
    """ Load std_msgs as Dependency """
    if "std_msgs" not in native.existing_rules():
        http_archive(
            name = "std_msgs",
            sha256 = "ee6592d37b00a94cab8216aac2cfb5120f6da09ffa94bfe197fe8dc76dd21326",
            strip_prefix = "std_msgs-0.5.13",
            build_file = "//third_party/std_msgs:std_msgs.BUILD",
            url = "https://github.com/ros/std_msgs/archive/0.5.13.tar.gz",
        )
