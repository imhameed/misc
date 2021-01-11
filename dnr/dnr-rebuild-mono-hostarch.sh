#!/bin/sh
SCRIPT_ROOT="$(cd "$(dirname "$0")"; pwd -P)"
ROOT="$SCRIPT_ROOT/runtime"

cd "$ROOT"
. '../vars.sh'

CONFIG=Debug
CONFIG=Release

#    /p:MonoCMakeUseLd="$HOME/ms/clang-9.x/out/bin/ld.lld" \
#    /p:MonoCMakeLd="$HOME/ms/clang-9.x/out/bin/ld.lld" \
#    /p:MonoCMakeAr="$HOME/ms/clang-9.x/out/bin/llvm-ar" \
#    /p:MonoCMakeRanlib="$HOME/ms/clang-9.x/out/bin/llvm-ranlib" \

#    /p:MonoCMakeExtraArgs="-DCMAKE_EXE_LINKER_FLAGS=-fuse-ld=$HOME/ms/clang-9.x/out/bin/ld.lld%20-DCMAKE_SHARED_LINKER_FLAGS=-fuse-ld=$HOME/ms/clang-9.x/out/bin/ld.lld%20-DCMAKE_LINKER=$HOME/ms/clang-9.x/out/bin/ld.lld%20-DCMAKE_AR=$HOME/ms/clang-9.x/out/bin/llvm-ar%20-DCMAKE_RANLIB=$HOME/ms/clang-9.x/out/bin/llvm-ranlib" \
    #/p:MonoLLVMUseCxx11Abi=true /p:MonoLLVMDir="$LLVM_HOSTARCH_PREFIX" \

MonoCMakeExtraArgs="$MonoCMakeExtraArgs_HOSTARCH" \
./build.sh \
    -configuration "$CONFIG" \
    --subset mono \
    /p:EnableAnalyzers=false \
    /p:MonoEnableLLVM=true \
    || exit 1

#CLR_CC="/usr/bin/aarch64-linux-gnu-gcc" CLR_CXX="/usr/bin/aarch64-linux-gnu-g++"
#/p:BuildMonoAOTCrossCompiler=true \

#./dotnet.sh build -c "$CONFIG" /t:PatchLocalMonoDotnet ./src/mono/mono.proj || exit 1

#./dotnet.sh build -c "$CONFIG" /p:EnableAnalyzers=false /t:PatchCoreClrCoreRoot ./src/mono/mono.proj || exit 1
# /usr/bin/aarch64-linux-gnu-gcc
# /usr/bin/aarch64-linux-gnu-g++
