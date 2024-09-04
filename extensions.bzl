"bsr extensions"

load(":bsr_import.bzl", "bsr_import")
load(":bsr_index.bzl", "bsr_index", "cleanup")


def _bsr_extension(module_ctx):
    for mod in module_ctx.modules:
        for sync in mod.tags.sync:
            lock_r = json.decode(module_ctx.read(sync.lock))
            for key, module in lock_r["modules"].items():
                if "local" in module:
                    continue
                name = cleanup(key)
                bsr_import(
                    name = name,
                    urls = [
                        "https://{}/archive/{}.tar.gz?imports=false".format(module["remote"], module["commit"]),
                    ],
                    deps = [
                        cleanup(dep) for dep in module["deps"]
                    ]
                )

            bsr_index(
                name = sync.name,
                lock = sync.lock
            )
    pass

sync = tag_class(attrs = {
    "name": attr.string(),
    "lock": attr.label(),
})

bsr = module_extension(
    implementation = _bsr_extension,
    tag_classes = {
        "sync": sync,
    },
)
