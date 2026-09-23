# AutoSD Bazel Template

This template gives a basic structure to build projects with Bazel.

This template structure is based on Eclipse S-CORE [reference integration repository](https://github.com/eclipse-score/reference_integration) `v0.9` release.

## Project Structure

* `bazel/`: common bazel module files included by `MODULE.bazel`
* `src/`: your project source code!
* `images/`: rules to build an AutoSD Bootc image that can be applied in a VM or device that is running AutoSD
* `patches/`: several patch files to build some external modules (i.e s-core components)'
* `scripts/`: some utility scripts
* `.bazelrc`: a file that contains several pre-defined rules to build targets (such as toolchian registration)
* `.bazelversion`: a file that contains the recommended verison of Bazel to use, Bazelisk will use it by default

## Useful Bazel Commands

NOTE: Any `bazel ...` commands can also be replaced or used with [bazelisk ...](https://github.com/bazelbuild/bazelisk).

* `bazel mod deps --lockfile_mode=update`: update lockfile
* `bazel mod tidy`: the equivalent of `go mod tidy` for Bazel; it rewrites the `use_repo(...)` calls
* `bazel clean --expunge`: clean all build cache

## Building with Bazel and AutoSD

There are too build configs to build projects (as defined in `.bazelrc`):

* `score-autosd-x86_64`
* `score-autosd-aarch64`

To build a target just run (`$config` being one of the above options):

```
bazel --config $config //src:hello
```

NOTE: AutoSD's toolchain does not support cross compilation.

## License

[Apache-2](./LICENSE)
