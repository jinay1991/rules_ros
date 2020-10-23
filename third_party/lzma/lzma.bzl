load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def lzma():
    """ Load lzma as dependency """
    if "lzma" not in native.existing_rules():
        http_archive(
            name = "lzma",
            build_file = "//third_party/lzma:lzma.BUILD",
            sha256 = "f6f4910fd033078738bd82bfba4f49219d03b17eb0794eb91efbae419f4aba10",
            strip_prefix = "xz-5.2.5",
            url = "https://tukaani.org/xz/xz-5.2.5.tar.gz",
        )
