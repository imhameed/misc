#!/bin/bash

ROOT="$(cd "$(dirname "$0")"/; pwd -P)"

cd "$ROOT"

LLVM_PREFIX="$ROOT/out"
SRC_PATH="$ROOT/llvm-project/llvm"

INTERNAL_LLVM_ASSERTS=On
#INTERNAL_LLVM_ASSERTS=Off

mkdir -p "$ROOT/build"

cd "$ROOT/build"
#CXXFLAGS='-D_GLIBCXX_USE_CXX11_ABI=0' \
    # -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld-7 -Wl,--icf=all" \
    # -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=lld-7 -Wl,--icf=all" \
    # -DCMAKE_C_COMPILER='clang-6.0' \
    # -DCMAKE_CXX_COMPILER='clang++-6.0' \
# -G 'Ninja' \
cmake \
    -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=/bin/ld.lld -Wl,--icf=all" \
    -DCMAKE_SHARED_LINKER_FLAGS="-fuse-ld=/bin/ld.lld -Wl,--icf=all" \
    -DCMAKE_MODULE_LINKER_FLAGS="-fuse-ld=/bin/ld.lld -Wl,--icf=all" \
    -DCMAKE_AR="/bin/llvm-ar" \
    -DCMAKE_RANLIB="/bin/llvm-ranlib" \
    -DCMAKE_C_COMPILER='/bin/clang' \
    -DCMAKE_CXX_COMPILER='/bin/clang++' \
    -DCMAKE_INSTALL_PREFIX="$LLVM_PREFIX" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DLLVM_EXTERNALIZE_DEBUGINFO=On \
    -DLLVM_BUILD_TESTS=Off \
    -DLLVM_INCLUDE_TESTS=Off \
    -DLLVM_BUILD_EXAMPLES=Off \
    -DLLVM_INCLUDE_EXAMPLES=Off \
    -DLLVM_TOOLS_TO_BUILD="opt;llc;llvm-config;llvm-dis" \
    -DLLVM_TARGETS_TO_BUILD="X86;ARM;AArch64" \
    -DLLVM_ENABLE_ASSERTIONS="$INTERNAL_LLVM_ASSERTS" \
    -DLLVM_ENABLE_LIBXML2=Off \
    -DHAVE_FUTIMENS=0 \
    "$SRC_PATH"

