load("@//third_party/googletest:googletest.bzl", "googletest")
load("@//third_party/roscpp_core:roscpp_core.bzl", "roscpp_core")
load("@//third_party/console_bridge:console_bridge.bzl", "console_bridge")
load("@//third_party/rules_boost:rules_boost.bzl", "rules_boost")

def ros_dependencies():
    """ Load 3rd party dependencies """
    googletest()
    roscpp_core()
    rules_boost()
    console_bridge()
