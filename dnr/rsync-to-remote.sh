#!/bin/sh
SCRIPTDIR="$(cd "$(dirname "$0")"; pwd -P)"
ROOT="$SCRIPTDIR/runtime"

cd "$ROOT"

#    --compress \

rsync \
    --verbose \
    --archive \
    --inplace \
    --rsh='ssh -p 2222' \
    --exclude='artifacts' \
    --exclude='.dotnet' \
    --exclude='.git' \
    './' \
    'imhameed@localhost:~/ms/dnr-9.x/runtime/'

# rsync \
#     --verbose \
#     --archive \
#     --inplace \
#     --rsh='ssh -p 2222' \
#     --exclude='artifacts' \
#     --exclude='.dotnet' \
#     --exclude='.git' \
#     './' \
#     "$HOME/ms/dnr-9.x/runtime/"
