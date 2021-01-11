#!/bin/sh
SCRIPT_ROOT="$(cd "$(dirname "$0")"; pwd -P)"
ROOT="$SCRIPT_ROOT"/runtime

cd "$ROOT"
. '../vars.sh'

CONFIG=Release

#    /p:MonoLLVMUseCxx11Abi=true /p:MonoEnableLLVM=false /p:MonoLLVMDir="$LLVM_PREFIX" /p:EnableAnalyzers=false \

ROOTFS_DIR="$ROOTFS_DIR_ARM64" \
MonoCMakeExtraArgs="$MonoCMakeExtraArgs_ARM64" \
./build.sh \
    -configuration "$CONFIG" \
    --subset mono \
    -arch arm64 \
    -os Linux \
    --cross \
    /p:ROOTFS_DIR="$ROOTFS_DIR_ARM64" \
    /p:MonoLLVMUseCxx11Abi=true \
    /p:MonoLibClang="/usr/lib/libclang.so.12" \
    /p:MonoEnableLLVM=true \
    /p:EnableAnalyzers=false \
    || exit 1

# ./build.sh \
#     -configuration "$CONFIG" \
#     --subset mono \
#     -arch arm64 \
#     -os Linux \
#     /p:CrossBuild=True \
#     /p:_MonoCCOption='CC="/usr/bin/aarch64-linux-gnu-gcc"' \
#     /p:_MonoCXXOption='CC="/usr/bin/aarch64-linux-gnu-gcc"' \
#     /p:MonoLLVMUseCxx11Abi=true /p:MonoEnableLLVM=false /p:MonoLLVMDir=$LLVM_PREFIX /p:EnableAnalyzers=false \
#     || exit 1

#CLR_CC="/usr/bin/aarch64-linux-gnu-gcc" CLR_CXX="/usr/bin/aarch64-linux-gnu-g++"
#/p:BuildMonoAOTCrossCompiler=true \

#./dotnet.sh build -c "$CONFIG" /t:PatchLocalMonoDotnet ./src/mono/mono.proj || exit 1

#./dotnet.sh build -c "$CONFIG" /p:EnableAnalyzers=false /t:PatchCoreClrCoreRoot ./src/mono/mono.proj || exit 1
# /usr/bin/aarch64-linux-gnu-gcc
# /usr/bin/aarch64-linux-gnu-g++
