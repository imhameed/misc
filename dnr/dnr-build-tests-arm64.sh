#!/bin/sh
SCRIPT_ROOT="$(cd "$(dirname "$0")"; pwd -P)"
ROOT="$SCRIPT_ROOT"'/runtime'

cd "$ROOT"
. '../vars.sh'

# ROOTFS_DIR="$ROOTFS_DIR_ARM64" \
# ./src/Native/build-native.sh release arm64 verbose cross

# ROOTFS_DIR="$ROOTFS_DIR_ARM64" \
# ./src/tests/build.sh Release arm64

# ROOTFS_DIR="$ROOTFS_DIR_ARM64" \
# ./src/tests/build.sh Release arm64 cross

ROOTFS_DIR="$ROOTFS_DIR_ARM64" \
__MonoToolPrefix=aarch64-linux-gnu- \
./src/tests/build.sh Release arm64 cross mono_aot
