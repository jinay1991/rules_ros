load("@rules_ros//ros:rules_debian.bzl", "http_debian")
load("@rules_ros//third_party:remotes.bzl", "UBUNTU_ARCHIVE")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def qt():
    """ Load QT as dependency """
    maybe(
        http_debian,
        name = "qt",
        repo = UBUNTU_ARCHIVE,
        package_group = {
            "pool/universe/q/qtbase-opensource-src/qtbase5-dev_5.12.8+dfsg-0ubuntu1_amd64.deb": "895413a6cb6a7fae65f6e26b7ac88e48440b49665bbc0181dc023b987064049e",
            # TODO: Add remaining dependencies
        },
        build_file = "//third_party/qt:qt.BUILD",
    )
