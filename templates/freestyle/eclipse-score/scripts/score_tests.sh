#!/bin/bash

BAZEL_BIN=${BAZEL_BIN:-bazelisk}

test_baselibs() {
    ${BAZEL_BIN}  build --config score-autosd-x86_64 @score_baselibs//examples/log_builtin:log_builtin
    ${BAZEL_BIN}  build --config score-autosd-x86_64 @score_baselibs//examples/log_cpp_init:log_cpp_init
    ${BAZEL_BIN}  build --config score-autosd-x86_64 @score_baselibs//examples/log_custom:log_custom
}

test_logging() {
     ${BAZEL_BIN}  build --config score-autosd-x86_64 @score_logging//examples:cargo_lock
}

test_baselibs
test_logging
