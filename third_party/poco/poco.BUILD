load("@rules_cc//cc:defs.bzl", "cc_library")

pcre_source = [
    "Foundation/src/pcre_config.c",
    "Foundation/src/pcre_byte_order.c",
    "Foundation/src/pcre_chartables.c",
    "Foundation/src/pcre_compile.c",
    "Foundation/src/pcre_exec.c",
    "Foundation/src/pcre_fullinfo.c",
    "Foundation/src/pcre_globals.c",
    "Foundation/src/pcre_maketables.c",
    "Foundation/src/pcre_newline.c",
    "Foundation/src/pcre_ord2utf8.c",
    "Foundation/src/pcre_study.c",
    "Foundation/src/pcre_tables.c",
    "Foundation/src/pcre_dfa_exec.c",
    "Foundation/src/pcre_get.c",
    "Foundation/src/pcre_jit_compile.c",
    "Foundation/src/pcre_refcount.c",
    "Foundation/src/pcre_string_utils.c",
    "Foundation/src/pcre_version.c",
    "Foundation/src/pcre_ucd.c",
    "Foundation/src/pcre_valid_utf8.c",
    "Foundation/src/pcre_xclass.c",
]

zlib_source = [
    "Foundation/src/adler32.c",
    "Foundation/src/compress.c",
    "Foundation/src/crc32.c",
    "Foundation/src/deflate.c",
    "Foundation/src/infback.c",
    "Foundation/src/inffast.c",
    "Foundation/src/inflate.c",
    "Foundation/src/inftrees.c",
    "Foundation/src/trees.c",
    "Foundation/src/zutil.c",
]

zlib_headers = [
    "Foundation/include/Poco/zconf.h",
    "Foundation/include/Poco/zlib.h",
]

cc_library(
    name = "foundation",
    srcs = glob([
        "Foundation/src/*.cpp",
    ]) + zlib_source + pcre_source,
    hdrs = glob([
        "Foundation/include/*.h",
    ]) + zlib_headers,
    includes = ["Foundation/include"],
)

cc_library(
    name = "json",
    srcs = glob([
        "JSON/src/*.cpp",
    ]),
    hdrs = glob([
        "JSON/include/*.h",
    ]),
    includes = ["JSON/include"],
    deps = [
        ":foundation",
    ],
)
