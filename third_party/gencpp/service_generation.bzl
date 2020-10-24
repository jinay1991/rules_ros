load("@rules_cc//cc:defs.bzl", "cc_library")
load("@bazel_skylib//lib:paths.bzl", "paths")
load("@//third_party/gencpp:message_generation.bzl", "RosGenProvider")

def _gensrv_outs(srcs, ros_package_name, extension):
    """ 
    Given a list of *.srv files, return the expected paths to the generated code with that extension.
    """
    if extension not in [".py", ".h"]:
        fail("Unknown extension %s".format(extension))

    msg_names = []
    for item in srcs:
        if not item.endswith(".srv"):
            fail("%s does not end in .srv" % item)
        item_name = paths.basename(item)[:-len(".srv")]

        if extension == ".py":
            item_name = "_" + item_name

        msg_names.append(item_name)

    outs = []
    res = "Response"
    req = "Request"
    for msg_name in msg_names:
        outs.append(paths.join(ros_package_name, msg_name + extension))
        outs.append(paths.join(ros_package_name, msg_name + res + extension))
        outs.append(paths.join(ros_package_name, msg_name + req + extension))

    if extension == ".py":
        outs += [
            paths.join(ros_package_name, "srv", "__init__.py"),
            paths.join(ros_package_name, "__init__.py"),
        ]

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
    for i in range(len(ctx.files.srcs)):
        srv_outs = _gensrv_outs([ctx.files.srcs[i].path], ctx.attr.ros_package_name, ".h")
        realouts = []

        #  [ctx.outputs.outs[j] if outs[a] in ctx.outputs.out[j].path for a in range(len(outs)) for j in range(len(ctx.outputs.outs))]
        for j in range(len(ctx.outputs.outs)):
            for a in range(len(srv_outs)):
                if srv_outs[a] in ctx.outputs.outs[j].path:
                    realouts.append(ctx.outputs.outs[j])

        ctx.actions.run(
            inputs = dep_srcs + ctx.files.srcs,
            outputs = realouts,
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

_gensrv = rule(
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

def generate_services(
        name,
        srcs = None,
        ros_package_name = None,
        deps = None):
    """
    Generates services. Uses the _genpy and _gencpp to shell out to the code generate scripts.

    Args:
        name:name
        srcs:srcs
        ros_package_name:ros_package_name
        deps:deps
    Returns:
        A generated message header
    """
    if not srcs:
        fail("srcs is required (*.srv files)")
    if not ros_package_name:
        fail("ros_package_name is required.")

    outs = _gensrv_outs(srcs, ros_package_name, ".h")

    _gensrv(
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
