load("@//third_party:dependencies.bzl", "ros_dependencies")

ros_dependencies()

load("@rules_python//python:pip.bzl", "pip_install")

pip_install(
    name = "pip_deps",
    requirements = "//third_party/gencpp:requirements.txt",
)
