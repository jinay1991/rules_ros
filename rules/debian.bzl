load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "workspace_and_buildfile")

def _list_file_in_archive(repo_ctx, deb_file):
    res = repo_ctx.execute([repo_ctx.attr._ar_tool, "-t", deb_file])
    if res.return_code != 0:
        fail("Running {} failed with stderr:\n{}".format(repo_ctx.attr._ar_tool, res.stderr))
    file_list = [item for item in res.stdout.split("\n") if item]
    return file_list

def _find_data_archive(repo_ctx, file_list):
    data_archives = [item for item in file_list if item.startswith("data.tar")]
    if not data_archives:
        fail("Debian package {} doesn't contain a data archive.".format(repo_ctx.name))
    if len(data_archives) > 1:
        fail("Debian package {} contains multiple data archives.".format(repo_ctx.name))
    return data_archives[0]

def _extract_debian_package(repo_ctx, deb_file):
    file_list = _list_file_in_archive(repo_ctx, deb_file)
    data_archive_filename = _find_data_archive(repo_ctx, file_list)
    res = repo_ctx.execute([repo_ctx.attr._ar_tool, "-x", deb_file, data_archive_filename])
    if res.return_code != 0:
        fail("Running {} failed with stderr:\n{}".format(repo_ctx.attr._ar_tool, res.stderr))
    repo_ctx.extract(
        data_archive_filename,
        stripPrefix = repo_ctx.attr.strip_prefix,
    )
    repo_ctx.delete(data_archive_filename)

def _debian_archive_impl(repo_ctx):
    for file_label in repo_ctx.attr.files:
        repo_ctx.report_progress("Extracting {}".format(file_label))
        deb_file = repo_ctx.path(file_label)
        _extract_debian_package(repo_ctx, deb_file)

    workspace_and_buildfile(repo_ctx)

_debian_archive = repository_rule(
    implementation = _debian_archive_impl,
    local = False,
    attrs = {
        "files": attr.label_list(mandatory = True, allow_empty = False, allow_files = True),
        "strip_prefix": attr.string(),
        "build_file": attr.label(),
        "build_file_content": attr.string(),
        "workspace_file": attr.label(),
        "workspace_file_content": attr.string(),
        "_ar_tool": attr.string(default = "/usr/bin/ar"),
    },
)

def debian_archive(name, package_group, strip_prefix = "", build_file = None, build_file_content = None):
    file_labels = []
    for path, sha256 in package_group.items():
        file_label = "{}_{}".format(name, sha256)
        file_labels.append(file_label)
        http_file(
            name = file_label,
            urls = [path],
            sha256 = sha256,
            downloaded_file_path = "downloaded",
        )

    file_targets = ["@{}//file:downloaded".format(file_label) for file_label in file_labels]

    _debian_archive(
        name = name,
        files = file_targets,
        strip_prefix = strip_prefix,
        build_file = build_file,
        build_file_content = build_file_content,
    )
