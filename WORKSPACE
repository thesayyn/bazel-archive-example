load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_features",
    sha256 = "5d7e4eb0bb17aee392143cd667b67d9044c270a9345776a5e5a3cccbc44aa4b3",
    strip_prefix = "bazel_features-1.13.0",
    url = "https://github.com/bazel-contrib/bazel_features/releases/download/v1.13.0/bazel_features-v1.13.0.tar.gz",
)

load("@bazel_features//:deps.bzl", "bazel_features_deps")

bazel_features_deps()

http_archive(
    name = "registry_bsr_repo",
    build_file_content = """
proto_library(
    name = "protos",
    visibility = ["//visibility:public"],
    srcs = glob(["**/*.proto"]),
)
    """,
    urls = [
        "https://buf.build/bufbuild/registry/archive/main.tar.gz?imports=true",
    ],
)

http_archive(
    name = "com_google_protobuf",
    strip_prefix = "protobuf-27.2",
    urls = [
        "https://github.com/protocolbuffers/protobuf/archive/refs/tags/v27.2.zip",
    ],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

http_archive(
    name = "rules_proto",
    sha256 = "6fb6767d1bef535310547e03247f7518b03487740c11b6c6adb7952033fe1295",
    strip_prefix = "rules_proto-6.0.2",
    url = "https://github.com/bazelbuild/rules_proto/releases/download/6.0.2/rules_proto-6.0.2.tar.gz",
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies")

rules_proto_dependencies()

load("@rules_proto//proto:setup.bzl", "rules_proto_setup")

rules_proto_setup()

load("@rules_proto//proto:toolchains.bzl", "rules_proto_toolchains")

rules_proto_toolchains()

http_archive(
    name = "rules_python",
    sha256 = "778aaeab3e6cfd56d681c89f5c10d7ad6bf8d2f1a72de9de55b23081b2d31618",
    strip_prefix = "rules_python-0.34.0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.34.0/rules_python-0.34.0.tar.gz",
)

load("@rules_python//python:repositories.bzl", "py_repositories")

py_repositories()

http_archive(
    name = "toolchains_protoc",
    sha256 = "3898f8e621ca5b3c7b94300c5ae19075d5bb28349d6e6f407490a466ba1e2544",
    strip_prefix = "toolchains_protoc-0.3.1",
    url = "https://github.com/aspect-build/toolchains_protoc/releases/download/v0.3.1/toolchains_protoc-v0.3.1.tar.gz",
)

load("@toolchains_protoc//protoc:repositories.bzl", "rules_protoc_dependencies")

rules_protoc_dependencies()

rules_proto_dependencies()

bazel_features_deps()

load("@toolchains_protoc//protoc:toolchain.bzl", "protoc_toolchains")

protoc_toolchains(
    name = "protoc_toolchains",
    version = "v27.2",
)
