load("@rules_cc//cc:defs.bzl", "cc_library")

genrule(
    name = "generate_console_bridge_export",
    outs = ["console_bridge_export.h"],
    cmd = "echo '#define CONSOLE_BRIDGE_DLLAPI __attribute__((visibility(\"default\")))' > $(OUTS)",
)

cc_library(
    name = "console_bridge",
    srcs = glob(["src/**/*.cpp"]) + [":generate_console_bridge_export"],
    hdrs = glob(["include/**/*.h"]),
    includes = ["include"],
    visibility = ["//visibility:public"],
    deps = [],
)
