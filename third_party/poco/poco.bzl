load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def poco():
    """ Load poco as Dependency """
    if "poco" not in native.existing_rules():
        http_archive(
            name = "poco",
            sha256 = "eb2aeecd25d9733d1e223f459560cd285d4cbf60983f96468e6eb0097ac5f4a6",
            strip_prefix = "poco-1.10.1",
            build_file = "//third_party/poco:poco.BUILD",
            url = "https://pocoproject.org/releases/poco-1.10.1/poco-1.10.1.tar.gz",
        )
