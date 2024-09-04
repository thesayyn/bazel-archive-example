load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# BUILD.bazel template
_BSR_IMPORT_BUILD_TMPL = """
load("@rules_proto//proto:defs.bzl", "proto_library")

proto_library(
    name = "proto",
    srcs = glob(["**/*.proto"]),
    deps = [{}],
    visibility = ["//visibility:public"],
)
"""

def bsr_import(deps, **kwargs):
    http_archive(
        build_file_content = _BSR_IMPORT_BUILD_TMPL.format(",".join(['"@{}//:proto"'.format(dep) for dep in deps])),
        **kwargs
    )