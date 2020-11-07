workspace(name = "rules_ros")

load("@rules_ros//third_party:dependencies.bzl", "ros_dependencies")

ros_dependencies()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

load("@rules_python//python:pip.bzl", "pip_install")

pip_install(
    name = "pip_deps",
    requirements = "//third_party/gencpp:requirements.txt",
)
