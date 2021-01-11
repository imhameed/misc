#!/bin/sh
SCRIPT_ROOT="$(cd "$(dirname "$0")"; pwd -P)"
ROOT="$SCRIPT_ROOT"'/runtime'

cd "$ROOT"
. '../vars.sh'

MonoCMakeExtraArgs="$MonoCMakeExtraArgs_AMD64" \
./build.sh \
    -configuration "$CONFIG" \
    -subset mono+libs+clr \
    /p:EnableAnalyzers=false \
    /p:MonoLLVMUseCxx11Abi=true /p:MonoEnableLLVM=true \
    /p:MonoLLVMDir="$LLVM_AMD64_PREFIX" \
    /p:EnableAnalyzers=false \
    || exit 1Mono
