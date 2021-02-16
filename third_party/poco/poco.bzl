load("@rules_ros//rules:rules_debian.bzl", "debian_archive")

def poco():
    """ Load poco as Dependency """
    if "poco" not in native.existing_rules():
        debian_archive(
            name = "poco",
            urls = [
                "http://ports.ubuntu.com/pool/universe/p/poco/libpoco-dev_1.9.2-3ubuntu3_arm64.deb",
            ],
            sha256 = "293066f48e03cfc238cd81e85be33c5c217a4cb936986357ea89e1b1b09bcb1a",
            build_file = "//third_party/poco:poco.BUILD",
        )
