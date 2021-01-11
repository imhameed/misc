#!/bin/sh
SCRIPTDIR="$(cd "$(dirname "$0")"; pwd -P)"
ROOT="$SCRIPTDIR/runtime"
PROJ="$(basename "$SCRIPTDIR")"

cd "$ROOT"
screen -S "$PROJ" -d -m
screen -S "$PROJ" -X 'title' "$PROJ"
exec screen -d -r "$PROJ"

