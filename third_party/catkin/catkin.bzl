load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def catkin():
    """ Load catkin as Dependency """
    if "catkin" not in native.existing_rules():
        http_archive(
            name = "catkin",
            sha256 = "cc37332c003296f7b5f7b19848fcbde46b46493bdc8323cccf24a34306195b89",
            strip_prefix = "catkin-0.8.9",
            build_file = "//third_party/catkin:catkin.BUILD",
            url = "https://github.com/ros/catkin/archive/0.8.9.tar.gz",
        )
