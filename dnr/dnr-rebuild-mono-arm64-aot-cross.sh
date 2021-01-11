#!/bin/sh
SCRIPT_ROOT="$(cd "$(dirname "$0")"; pwd -P)"
ROOT="$SCRIPT_ROOT"/runtime

cd "$ROOT"
. '../vars.sh'

CONFIG=Release


MonoCMakeExtraArgs="$MonoCMakeExtraArgs_AMD64" \
ROOTFS_DIR="$ROOTFS_DIR_ARM64" \
./build.sh \
    -configuration "$CONFIG" \
    -s mono \
    -arch arm64 \
    -os Linux \
    /p:_MonoVerboseArg=VERBOSE=1 \
    /p:BuildMonoAOTCrossCompiler=true \
    /p:BuildMonoAOTCrossCompilerOnly=true \
    /p:MonoLibClang="$CLANG_PREFIX/../lib/libclang.so.9" \
    /p:EnableAnalyzers=false \
    /p:MonoLLVMUseCxx11Abi=true /p:MonoEnableLLVM=false \
    /p:MonoAOTLLVMUseCxx11Abi=false /p:MonoAOTEnableLLVM=true \
    /p:MonoAOTLLVMDir="$LLVM_AMD64_PREFIX" \
    || exit 1

