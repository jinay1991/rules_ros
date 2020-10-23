load("@//third_party/googletest:googletest.bzl", "googletest")
load("@//third_party/roscpp_core:roscpp_core.bzl", "roscpp_core")
load("@//third_party/console_bridge:console_bridge.bzl", "console_bridge")
load("@//third_party/boost:boost.bzl", "boost")
load("@//third_party/zlib:zlib.bzl", "zlib")
load("@//third_party/bzip2:bzip2.bzl", "bzip2")
load("@//third_party/lzma:lzma.bzl", "lzma")
load("@//third_party/zstd:zstd.bzl", "zstd")

def ros_dependencies():
    """ Load 3rd party dependencies """
    googletest()
    roscpp_core()
    lzma()
    boost()
    console_bridge()
    zlib()
    bzip2()
    zstd()
