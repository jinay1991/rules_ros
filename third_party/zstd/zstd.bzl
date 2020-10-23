load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def zstd():
    """ Load zstd as dependency """
    if "zstd" not in native.existing_rules():
        http_archive(
            name = "zstd",
            build_file = "//third_party/zstd:zstd.BUILD",
            sha256 = "98e91c7c6bf162bf90e4e70fdbc41a8188b9fa8de5ad840c401198014406ce9e",
            strip_prefix = "zstd-1.4.5",
            url = "https://github.com/facebook/zstd/releases/download/v1.4.5/zstd-1.4.5.tar.gz",
        )
