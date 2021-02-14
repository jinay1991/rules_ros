load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def poco():
    """ Load poco as Dependency """
    if "poco" not in native.existing_rules():
        http_archive(
            name = "poco",
            sha256 = "9cfa635dc4d3f7fa7e448d092927cb7ea7876e8d9a874d6d76c13e5e4341e9d4",
            strip_prefix = "poco-1.10.1",
            build_file = "//third_party/poco:poco.BUILD",
            url = "https://pocoproject.org/releases/poco-1.10.1/poco-1.10.1.tar.gz",
        )
