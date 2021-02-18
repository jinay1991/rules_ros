load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@rules_ros//ros:rules_debian.bzl", "debian_archive")
load("@rules_ros//third_party:remotes.bzl", "UBUNTU_ARCHIVE")

def ros():
    """ Load ros as Dependency """

    #################################
    # HOST INDEPENDENT DEPENDENCIES #
    #################################
    maybe(
        http_archive,
        name = "common_msgs",
        sha256 = "74af8cc88bdc9c23cbc270d322e50562857e2c877359423f389d51c0735ee230",
        strip_prefix = "common_msgs-1.13.1",
        build_file = "//third_party/ros:common_msgs.BUILD",
        url = "https://github.com/ros/common_msgs/archive/1.13.1.tar.gz",
    )

    maybe(
        http_archive,
        name = "std_msgs",
        sha256 = "ee6592d37b00a94cab8216aac2cfb5120f6da09ffa94bfe197fe8dc76dd21326",
        strip_prefix = "std_msgs-0.5.13",
        build_file = "//third_party/ros:std_msgs.BUILD",
        url = "https://github.com/ros/std_msgs/archive/0.5.13.tar.gz",
    )

    maybe(
        http_archive,
        name = "ros",
        sha256 = "7a1e729de9be807862b6ed721475fec74583f6dc0c06b233b06b1b9fda31291e",
        strip_prefix = "ros-1.15.7",
        build_file = "//third_party/ros:ros.BUILD",
        url = "https://github.com/ros/ros/archive/1.15.7.tar.gz",
    )

    maybe(
        http_archive,
        name = "roscpp_core",
        sha256 = "d5a0ad09fa878d9f3d6d7f3e8c7854f0f160aeeea9c4d332e3dc87552087ca68",
        strip_prefix = "roscpp_core-0.6.14",
        build_file = "//third_party/ros:roscpp_core.BUILD",
        url = "https://github.com/ros/roscpp_core/archive/0.6.14.tar.gz",
    )

    maybe(
        http_archive,
        name = "ros_comm",
        sha256 = "b3b75612feb447afe70600e3ba80bf3e356493a058ba8ebf2746e8db0c55165c",
        strip_prefix = "ros_comm-1.14.10",
        build_file = "//third_party/ros:ros_comm.BUILD",
        url = "https://github.com/ros/ros_comm/archive/1.14.10.tar.gz",
    )

    maybe(
        http_archive,
        name = "rosconsole",
        sha256 = "0b2cbc4f9a92466c0fbae7863482b286ef87692de4941527cb429e6c74639246",
        strip_prefix = "rosconsole-1.14.3",
        build_file = "//third_party/ros:rosconsole.BUILD",
        url = "https://github.com/ros/rosconsole/archive/1.14.3.tar.gz",
    )

    maybe(
        http_archive,
        name = "catkin",
        sha256 = "cc37332c003296f7b5f7b19848fcbde46b46493bdc8323cccf24a34306195b89",
        strip_prefix = "catkin-0.8.9",
        build_file = "//third_party/ros:catkin.BUILD",
        url = "https://github.com/ros/catkin/archive/0.8.9.tar.gz",
    )

    maybe(
        http_archive,
        name = "rospkg",
        sha256 = "39e801b104e4c31ddc60a0c1a526197429cfbbe72b574a3cad851e624ff54249",
        strip_prefix = "rospkg-1.2.8",
        build_file = "//third_party/ros:rospkg.BUILD",
        url = "https://github.com/ros-infrastructure/rospkg/archive/1.2.8.tar.gz",
    )

    maybe(
        http_archive,
        name = "genmsg_archive",
        sha256 = "0e414846823a2aaa7781f81268251c7c9a45ff96cef8e6a78bbbbcf7e4c28d56",
        strip_prefix = "genmsg-0.5.16",
        build_file = "//third_party/ros:genmsg.BUILD",
        url = "https://github.com/ros/genmsg/archive/0.5.16.tar.gz",
    )

    maybe(
        http_archive,
        name = "gencpp_archive",
        sha256 = "05acfeeb1bbc374356bf7674fee2a7aab3bf6a48ebad4a06fd0f0d4455a60720",
        strip_prefix = "gencpp-0.6.5",
        build_file = "//third_party/ros:gencpp.BUILD",
        url = "https://github.com/ros/gencpp/archive/0.6.5.tar.gz",
    )

    maybe(
        http_archive,
        name = "genpy_archive",
        sha256 = "523d20068171ce7e5b4c453eba7976aafa819e6b5af806ffdf6bc1d7a1dfc2a8",
        strip_prefix = "genpy-0.6.14",
        build_file = "//third_party/ros:genpy.BUILD",
        url = "https://github.com/ros/genpy/archive/0.6.14.tar.gz",
    )

    maybe(
        http_archive,
        name = "ros_comm_msgs",
        sha256 = "5b8b91e8671d03ea84ba32a3ea7360bc4594655e7ba3ec6677a984f393aaafbd",
        strip_prefix = "ros_comm_msgs-1.11.3",
        build_file = "//third_party/ros:ros_comm_msgs.BUILD",
        url = "https://github.com/ros/ros_comm_msgs/archive/1.11.3.tar.gz",
    )

    maybe(
        http_archive,
        name = "console_bridge",
        sha256 = "2ff175a9bb2b1849f12a6bf972ce7e4313d543a2bbc83b60fdae7db6e0ba353f",
        strip_prefix = "console_bridge-1.0.1",
        build_file = "//third_party/ros:console_bridge.BUILD",
        url = "https://github.com/ros/console_bridge/archive/1.0.1.tar.gz",
    )

    ########################
    # ADAPTED DEPENDENCIES #
    ########################
    maybe(
        http_archive,
        name = "class_loader",
        sha256 = "9ac308d44c746032c4dfd50516de5f0b3aa18bc29013dc3682b29495cd6a83d9",
        strip_prefix = "class_loader-1.4.1",
        build_file = "//third_party/ros:class_loader.BUILD",
        url = "https://github.com/ros/class_loader/archive/1.4.1.tar.gz",
    )

    maybe(
        http_archive,
        name = "pluginlib",
        sha256 = "9cfa635dc4d3f7fa7e448d092927cb7ea7876e8d9a874d6d76c13e5e4341e9d4",
        strip_prefix = "pluginlib-4.1.1",
        build_file = "//third_party/ros:pluginlib.BUILD",
        url = "https://github.com/ros/pluginlib/archive/4.1.1.tar.gz",
    )

    maybe(
        http_archive,
        name = "message_runtime",
        sha256 = "c5f97145b5095389d2459c0e7d879c07f5878d0b7ec84b5c388abddfd52bf448",
        strip_prefix = "message_runtime-0.4.13",
        build_file = "//third_party/ros:pluginlib.BUILD",
        url = "https://github.com/ros/message_runtime/archive/0.4.13.tar.gz",
    )

    ###########################
    # TRANSITIVE DEPENDENCIES #
    ###########################
    maybe(
        debian_archive,
        name = "poco",
        repo = UBUNTU_ARCHIVE,
        package_group = {
            "pool/universe/p/poco/libpoco-dev_1.10.0-6_amd64.deb": "582cb98c266d00fc3d5e7c9ae8272ee476bf12877a526670b29185a5cd6d62e7",
            "pool/universe/p/poco/libpocofoundation70_1.10.0-6_amd64.deb": "7fb256f40760102d4987fcf13bc9b6f6d63978ed26bd99b803c3904a2dd6e68f",
        },
        build_file = "//third_party/ros:poco.BUILD",
    )

    maybe(
        http_archive,
        name = "double_conversion",
        sha256 = "a63ecb93182134ba4293fd5f22d6e08ca417caafa244afaa751cbfddf6415b13",
        strip_prefix = "double-conversion-3.1.5",
        build_file = "//third_party/ros:double_conversion.BUILD",
        url = "https://github.com/google/double-conversion/archive/v3.1.5.tar.gz",
    )
