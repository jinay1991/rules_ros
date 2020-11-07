load("@rules_cc//cc:defs.bzl", "cc_library")
load("@bazel_skylib//lib:paths.bzl", "paths")

RosGenProvider = provider()

def _genmsg_outs(srcs, ros_package_name, extension):
    """ 
    Given a list of *.msg files, return the expected paths to the generated code with that extension.
    """
    if extension not in [".py", ".h"]:
        fail("Unknown extension %s".format(extension))

    msg_names = []
    for item in srcs:
        if not item.endswith(".msg"):
            fail("%s does not end in .msg" % item)
        item_name = paths.basename(item)[:-len(".msg")]

        if extension == ".py":
            item_name = "_" + item_name

        msg_names.append(item_name)

    outs = [
        paths.join(ros_package_name, msg_name + extension)
        for msg_name in msg_names
    ]

    if extension == ".py":
        outs.append(
            paths.join(ros_package_name, "__init__.py"),
        )

    return outs

def _gencpp_impl(ctx):
    """
    Implementation for the gencpp rule. Shells out to the sripts shipped with gencpp
    """
    srcpath = ctx.files.srcs[0].dirname
    outpath = ctx.outputs.outs[0].dirname

    dep_flags = []
    dep_srcs = []
    for dep in ctx.attr.deps:
        dep_srcs = dep_srcs + dep[RosGenProvider].srcs
        dep_flags.append("-I")
        dep_flags.append("{}:{}".format(dep[RosGenProvider].package_name, dep[RosGenProvider].srcs[0].dirname))

    # Generate the actual messages
    for i in range(len(ctx.outputs.outs)):
        ctx.actions.run(
            inputs = [ctx.files.srcs[i]] + dep_srcs + ctx.files.srcs,
            outputs = [ctx.outputs.outs[i]],
            executable = ctx.executable._gen_script,
            arguments = [
                "-o",
                outpath,
                "-p",
                ctx.attr.ros_package_name,
                "-I",
                "{}:{}".format(ctx.attr.ros_package_name, srcpath),
                "-e",
                "{}".format(ctx.executable._gen_script.dirname + "/gencpp_runner.runfiles/gencpp_archive/scripts"),
            ] + dep_flags + [ctx.files.srcs[i].path],
        )

    return [RosGenProvider(package_name = ctx.attr.ros_package_name, srcs = ctx.files.srcs)]

_gencpp = rule(
    implementation = _gencpp_impl,
    output_to_genfiles = True,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "ros_package_name": attr.string(),
        "deps": attr.label_list(allow_empty = True),
        "_gen_script": attr.label(
            default = Label("@gencpp_archive//:gencpp_runner"),
            executable = True,
            cfg = "host",
        ),
        "outs": attr.output_list(),
    },
)

def generate_messages(
        name,
        srcs = None,
        ros_package_name = None,
        deps = None):
    """
    Generates messages. Uses the _genpy and _gencpp to shell out to the code generate scripts.

    Args:
        name:name
        srcs:srcs
        ros_package_name:ros_package_name
        deps:deps
    Returns:
        A generated message header
    """
    if not srcs:
        fail("srcs is required (*.msg files)")
    if not ros_package_name:
        fail("ros_package_name is required.")

    outs = _genmsg_outs(srcs, ros_package_name, ".h")

    _gencpp(
        name = name + "_gen_cpp_out",
        srcs = srcs,
        ros_package_name = ros_package_name,
        outs = outs,
        deps = [Label(a + "_gen_cpp_out") for a in deps] if deps else [],
    )
    return cc_library(
        name = name,
        hdrs = outs,
        includes = [""],
        deps = deps if deps else [],
    )
