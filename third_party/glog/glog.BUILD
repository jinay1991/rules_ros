load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "glog",
    srcs = [
        "src/base/commandlineflags.h",
        "src/base/googleinit.h",
        "src/base/mutex.h",
        "src/demangle.cc",
        "src/demangle.h",
        "src/logging.cc",
        "src/raw_logging.cc",
        "src/signalhandler.cc",
        "src/stacktrace.h",
        "src/stacktrace_generic-inl.h",
        "src/stacktrace_libunwind-inl.h",
        "src/stacktrace_powerpc-inl.h",
        "src/stacktrace_windows-inl.h",
        "src/stacktrace_x86-inl.h",
        "src/stacktrace_x86_64-inl.h",
        "src/symbolize.cc",
        "src/symbolize.h",
        "src/utilities.cc",
        "src/utilities.h",
        "src/vlog_is_on.cc",
        ":config_h",
    ],
    hdrs = [
        "src/glog/log_severity.h",
        ":logging_h",
        ":raw_logging_h",
        ":stl_logging_h",
        ":vlog_is_on_h",
    ],
    copts = [
        "-Wno-sign-compare",  # Disable warnings that exists in glog.
        "-Wno-unused-function",
        "-Wno-unused-local-typedefs",
        "-Wno-unused-variable",
        "-DGLOG_BAZEL_BUILD",
        "-DGOOGLE_NAMESPACE='google'",  # Inject a C++ namespace.
        "-DHAVE_PTHREAD",  # Allows src/base/mutex.h to include pthread.h.
        "-DHAVE_SYS_UTSNAME_H",  # Allows src/logging.cc to determine the host name.
        "-DHAVE_SYS_SYSCALL_H",  # For src/utilities.cc.
        "-DHAVE_SYS_TIME_H",
        "-DHAVE_STDINT_H",
        "-DHAVE_STRING_H",
        "-DHAVE_SIGACTION",  # Enable dumping stacktrace upon sigaction.
        "-DHAVE_PREAD",  # For logging.cc.
        "-DHAVE___ATTRIBUTE__",
        "-I%s/glog_internal" % "$(GENDIR)",  # Include generated header files.
        "-DHAVE_LIB_GFLAGS",  # Use gflags to parse CLI arguments.
    ],
    strip_include_prefix = "src",
    visibility = ["//visibility:public"],
    deps = [
        "@com_github_gflags_gflags//:gflags",
    ],
)

genrule(
    name = "gen_sh",
    outs = [
        "gen.sh",
    ],
    cmd = r'''\
            #!/bin/sh
            cat > $@ <<"EOF"
            sed -e 's/@ac_cv_cxx_using_operator@/1/g' \
                -e 's/@ac_cv_have_unistd_h@/1/g' \
                -e 's/@ac_cv_have_stdint_h@/1/g' \
                -e 's/@ac_cv_have_systypes_h@/1/g' \
                -e 's/@ac_cv_have_libgflags@/{}/g' \
                -e 's/@ac_cv_have_uint16_t@/1/g' \
                -e 's/@ac_cv_have___builtin_expect@/1/g' \
                -e 's/@ac_cv_have_.*@/0/g' \
                -e 's/@ac_google_start_namespace@/namespace google {{/g' \
                -e 's/@ac_google_end_namespace@/}}/g' \
                -e 's/@ac_google_namespace@/google/g' \
                -e 's/@ac_cv___attribute___noinline@/__attribute__((noinline))/g' \
                -e 's/@ac_cv___attribute___noreturn@/__attribute__((noreturn))/g' \
                -e 's/@ac_cv___attribute___printf_4_5@/__attribute__((__format__ (__printf__, 4, 5)))/g'
            EOF
            '''.format(int(with_gflags)),
)

genrule(
    name = "config_h",
    srcs = [
        "src/config.h.cmake.in",
    ],
    outs = [
        "glog_internal/config.h",
    ],
    cmd = "awk '{ gsub(/^#cmakedefine/, \"//cmakedefine\"); print; }' $< > $@",
)

[
    genrule(
        name = "%s_h" % f,
        srcs = [
            "src/glog/%s.h.in" % f,
        ],
        outs = [
            "src/glog/%s.h" % f,
        ],
        cmd = "$(location :gen_sh) < $< > $@",
        tools = [":gen_sh"],
    )
    for f in [
        "vlog_is_on",
        "stl_logging",
        "raw_logging",
        "logging",
    ]
]
