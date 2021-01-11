#!/bin/sh
SCRIPT_ROOT="$(cd "$(dirname "$0")"; pwd -P)"
ROOT="$SCRIPT_ROOT"/runtime

MONOCFG=Release
MONOCFG=Debug

cd "$ROOT"
set -o xtrace
../dnr-rebuild-mono-amd64.sh && \
    cp \
        "artifacts/bin/mono/Linux.x64.$MONOCFG/libcoreclr.so" \
        "artifacts/bin/mono/Linux.x64.$MONOCFG/libcoreclr.so.dbg" \
        "artifacts/bin/mono/Linux.x64.$MONOCFG/System.Private.CoreLib".* \
        artifacts/tests/coreclr/Linux.x64.Release/Tests/Core_Root.mono/
