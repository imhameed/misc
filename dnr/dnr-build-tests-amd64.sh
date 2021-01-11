#!/bin/sh
SCRIPT_ROOT="$(cd "$(dirname "$0")"; pwd -P)"
ROOT="$SCRIPT_ROOT"'/runtime'

cd "$ROOT"
. '../vars.sh'

MonoCMakeExtraArgs="$MonoCMakeExtraArgs_AMD64" \
./src/tests/build.sh Release
