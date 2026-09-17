# AutoSD Bazel Template

This template gives a basic structure to build projects with Bazel.

## Project Structure

* `bazel`: common bazel module files included by `MODULE.bazel`
* `src`: project source code
* `images`: rules to build an AutoSD Bootc image that can be applied in a VM or device that is running AutoSD

## Useful Bazel Commands

NOTE: Any `bazel ...` commands can also be replaced or used with [bazelisk ...](https://github.com/bazelbuild/bazelisk).

* `bazel mod deps --lockfile_mode=update`: update lockfile
* `bazel mod tidy`: the equivalent of `go mod tidy` for Bazel; it rewrites the `use_repo(...)` calls
* `bazel clean --expunge`: clean all build cache

## License

[Apache-2](./LICENSE)
