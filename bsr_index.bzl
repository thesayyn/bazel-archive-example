""

def cleanup(str):
    return str.replace(".", "_").replace("/", "_").replace(":", "_")

_BUILD_TMPL = """
alias(
    name = "{name}",
    actual = "{actual}",
    visibility = ["//visibility:public"]
)   
"""

def _bsr_index_impl(rctx):
    lock_r = json.decode(rctx.read(rctx.attr.lock))

    for key, module in lock_r["modules"].items():
        if "local" in module:
            continue
        repo_name = cleanup(key)
        rctx.file(
            "{}/BUILD.bazel".format(module["remote"]),
            _BUILD_TMPL.format(
                name = module["commit"],
                actual = "@{}//:proto".format(repo_name),
            ),
        )

bsr_index = repository_rule(
    implementation = _bsr_index_impl,
    attrs = {
        "lock": attr.label(),
    },
)
