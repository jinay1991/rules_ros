load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def boost():
    """ Load boost as Dependency """
    if "boost" not in native.existing_rules():
        http_archive(
            name = "boost",
            sha256 = "d73a8da01e8bf8c7eda40b4c84915071a8c8a0df4a6734537ddde4a8580524ee",
            strip_prefix = "boost_1_71_0",
            build_file = "//third_party/boost:boost.BUILD",
            url = "https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.tar.bz2",
        )
