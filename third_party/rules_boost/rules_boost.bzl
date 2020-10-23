load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def rules_boost():
    """ Load rules_boost as dependencies """
    if "rules_boost" not in native.existing_rules():
        git_repository(
            name = "com_github_nelhage_rules_boost",
            branch = "master",
            remote = "https://github.com/nelhage/rules_boost",
        )
