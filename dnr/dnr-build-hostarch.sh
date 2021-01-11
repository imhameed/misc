#!/bin/sh
SCRIPT_ROOT="$(cd "$(dirname "$0")"; pwd -P)"
ROOT="$SCRIPT_ROOT"'/runtime'

cd "$ROOT"
. '../vars.sh'

MonoCMakeExtraArgs="$MonoCMakeExtraArgs_HOSTARCH" \
./build.sh \
    -configuration "$CONFIG" \
    -subset mono+libs+clr \
    /p:EnableAnalyzers=false \
    /p:MonoLLVMUseCxx11Abi=true /p:MonoEnableLLVM=true \
    /p:MonoLLVMDir="$LLVM_HOSTARCH_PREFIX" \
    || exit 1
