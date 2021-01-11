#!/bin/sh
SCRIPT_ROOT="$(cd "$(dirname "$0")"; pwd -P)"
ROOT="$SCRIPT_ROOT"'/runtime'

cd "$ROOT"
. '../vars.sh'

ROOTFS_DIR="$ROOTFS_DIR_ARM64" \
./build.sh \
    -configuration "$CONFIG" \
    -arch arm64 \
    -os Linux \
    --cross \
    /p:MonoLLVMUseCxx11Abi=true /p:MonoEnableLLVM=true \
    /p:EnableAnalyzers=false \
    || exit 1

    # /p:MonoLLVMUseCxx11Abi=true /p:MonoEnableLLVM=false \
    # /p:MonoLLVMDir="$LLVM_PREFIX" \
