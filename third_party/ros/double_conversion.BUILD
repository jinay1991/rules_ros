load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "double_conversion",
    srcs = [
        "double-conversion/bignum.cc",
        "double-conversion/bignum-dtoa.cc",
        "double-conversion/cached-powers.cc",
        "double-conversion/diy-fp.cc",
        "double-conversion/double-conversion.cc",
        "double-conversion/fast-dtoa.cc",
        "double-conversion/fixed-dtoa.cc",
        "double-conversion/strtod.cc",
        "double-conversion/utils.h",
    ],
    hdrs = [
        "double-conversion/bignum.h",
        "double-conversion/bignum-dtoa.h",
        "double-conversion/cached-powers.h",
        "double-conversion/diy-fp.h",
        "double-conversion/double-conversion.h",
        "double-conversion/fast-dtoa.h",
        "double-conversion/fixed-dtoa.h",
        "double-conversion/ieee.h",
        "double-conversion/strtod.h",
    ],
    linkopts = [
        "-lm",
    ],
    visibility = ["//visibility:public"],
)
