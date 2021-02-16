load("@rules_ros//rules:debian.bzl", "debian_archive")

def poco():
    """ Load poco as Dependency """
    if "poco" not in native.existing_rules():
        debian_archive(
            name = "poco",
            repo = "http://archive.ubuntu.com/ubuntu/pool/universe/p/poco",
            package_group = {
                "libpoco-dev_1.10.0-6_amd64.deb": "582cb98c266d00fc3d5e7c9ae8272ee476bf12877a526670b29185a5cd6d62e7",
                "libpocofoundation70_1.10.0-6_amd64.deb": "7fb256f40760102d4987fcf13bc9b6f6d63978ed26bd99b803c3904a2dd6e68f",
                "libpocojson70_1.10.0-6_amd64.deb": "1835ca9bf44dc15769ae5f682c9164694b526cb498db5bba191c9febe733ef4f",
            },
            build_file = "//third_party/poco:poco.BUILD",
        )
