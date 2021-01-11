#!/bin/sh
SCRIPT_ROOT="$(cd "$(dirname "$0")"; pwd -P)"
ROOT="$SCRIPT_ROOT"/runtime

cd "$ROOT"
. '../vars.sh'

CONFIG=Release

# ROOTFS_DIR="$ROOTFS_DIR_ARM64" \
# ./eng/common/msbuild.sh ./src/mono/mono.proj \
#     /p:BuildMonoAotCrossCompiler=true \
#     /p:BuildMonoAotCrossCompilerOnly=true \
#     /p:MonoLibClang="$CLANG_PREFIX/../lib/libclang.so.9" \
#     /p:Configuration=Release \
#     /p:CrossBuild=true \
#     /p:TargetArchitecture=arm64 \
#     /p:MonoAOTEnableLLVM=true \
#     /p:MonoAOTLLVMUseCxx11Abi=false \
#     /p:MonoEnableLLVM=false \
#     /p:MonoLLVMDir="$LLVM_PREFIX" \
#     || exit 1

ROOTFS_DIR="$ROOTFS_DIR_ARM64" \
./build.sh \
    -configuration "$CONFIG" \
    --subset mono \
    -arch arm64 \
    -os Linux \
    /p:MonoLibClang="$CLANG_PREFIX/../lib/libclang.so.9" \
    /p:EnableAnalyzers=false \
    /p:MonoLLVMUseCxx11Abi=true /p:MonoEnableLLVM=false \
    || exit 1

    #/p:MonoLLVMDir="$LLVM_ARM64_PREFIX" \
