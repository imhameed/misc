#!/bin/bash

ROOT="$(cd "$(dirname "$0")"/; pwd -P)"

cd "$ROOT"

LLVM_PREFIX="$ROOT"/out-arm64
SRC_PATH="$ROOT"/src/llvm

INTERNAL_LLVM_ASSERTS=On
#INTERNAL_LLVM_ASSERTS=Off

mkdir -p "$ROOT"/build-arm64

cd "$ROOT"/build-arm64
#CXXFLAGS='-D_GLIBCXX_USE_CXX11_ABI=0' \
cmake \
    -DCMAKE_TOOLCHAIN_FILE=../arm64-toolchain.cmake \
    -DCMAKE_CROSSCOMPILING=True \
    -DLLVM_TABLEGEN=$HOME/ms/clang-9.x/out/bin/llvm-tblgen \
    -DCLANG_TABLEGEN=$HOME/ms/clang-9.x/out/bin/clang-tblgen \
    -DLLVM_DEFAULT_TARGET_TRIPLE=aarch64-linux-gnu \
    -DLLVM_TARGET_ARCH=ARM64 \
    -DCMAKE_INSTALL_PREFIX="$LLVM_PREFIX" \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_BUILD_TESTS=Off \
    -DLLVM_INCLUDE_TESTS=Off \
    -DLLVM_BUILD_EXAMPLES=Off \
    -DLLVM_INCLUDE_EXAMPLES=Off \
    -DLLVM_TOOLS_TO_BUILD="opt;llc;llvm-config;llvm-dis" \
    -DLLVM_TARGETS_TO_BUILD="X86;ARM;AArch64" \
    -DLLVM_ENABLE_ASSERTIONS=$INTERNAL_LLVM_ASSERTS \
    -DLLVM_ENABLE_LIBXML2=Off \
    -DHAVE_FUTIMENS=0 \
    $SRC_PATH

