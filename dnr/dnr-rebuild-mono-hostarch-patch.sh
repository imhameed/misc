#!/bin/sh
SCRIPT_ROOT="$(cd "$(dirname "$0")"; pwd -P)"
ROOT="$SCRIPT_ROOT"/runtime

MONOCFG=Release
#MONOCFG=Debug

cd "$ROOT"

. ../vars.sh

set -o xtrace
../dnr-rebuild-mono-hostarch.sh && \
    cp \
        "artifacts/bin/mono/Linux.$HOSTARCH.$MONOCFG/libcoreclr.so" \
        "artifacts/bin/mono/Linux.$HOSTARCH.$MONOCFG/libcoreclr.so.dbg" \
        "artifacts/bin/mono/Linux.$HOSTARCH.$MONOCFG/System.Private.CoreLib".* \
        artifacts/tests/coreclr/Linux.$HOSTARCH.Release/Tests/Core_Root.mono/
