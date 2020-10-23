load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def glog():
    """ Load glog as Dependency """
    if "com_github_gflags_gflags" not in native.existing_rules():
        http_archive(
            name = "com_github_gflags_gflags",
            strip_prefix = "gflags-2.2.2",
            urls = [
                "https://mirror.bazel.build/github.com/gflags/gflags/archive/v2.2.2.tar.gz",
                "https://github.com/gflags/gflags/archive/v2.2.2.tar.gz",
            ],
        )

    if "glog" not in native.existing_rules():
        http_archive(
            name = "glog",
            sha256 = "f28359aeba12f30d73d9e4711ef356dc842886968112162bc73002645139c39c",
            strip_prefix = "glog-0.4.0",
            url = "https://github.com/google/glog/archive/v0.4.0.tar.gz",
        )
