uname_arch_name="$(uname -m)"

case "$uname_arch_name" in
    x86_64) ARCHNAME=x64
        ;;
    aarch64) ARCHNAME=arm64
        ;;
    *)
        echo "vars.sh: unknown arch $uname_arch_name"
        exit 1
        ;;
esac

LLVM_AMD64_PREFIX="/ms/llvm-11.x/out"
LLVM_ARM64_PREFIX="/ms/llvm-11.x/out-arm64"
LLVM_HOSTARCH_PREFIX="/ms/llvm-11.x/out"

CLANG_PREFIX="$HOME/.local/llvm/clang+llvm-9.0.1-aarch64-linux-gnu/bin"
CLANG_PREFIX="/bin"
CLANG_PREFIX="/programs/llvm/13.x/bin"


ROOTFS_DIR_ARM64="/ms/rootfs/arm64-xenial"

#MonoCMakeExtraArgs_HOSTARCH="-DCMAKE_EXE_LINKER_FLAGS=-fuse-ld=$CLANG_PREFIX/ld.lld -DCMAKE_SHARED_LINKER_FLAGS=-fuse-ld=$CLANG_PREFIX/ld.lld -DCMAKE_LINKER=$CLANG_PREFIX/ld.lld -DCMAKE_AR=$CLANG_PREFIX/llvm-ar -DCMAKE_RANLIB=$CLANG_PREFIX/llvm-ranlib"
MonoCMakeExtraArgs_HOSTARCH="-DCMAKE_C_COMPILER=$CLANG_PREFIX/clang -DCMAKE_CXX_COMPILER=$CLANG_PREFIX/clang++ -DCMAKE_EXE_LINKER_FLAGS=-fuse-ld=$CLANG_PREFIX/ld.lld -DCMAKE_SHARED_LINKER_FLAGS=-fuse-ld=$CLANG_PREFIX/ld.lld -DCMAKE_LINKER=$CLANG_PREFIX/ld.lld"

CONFIG=Release
HOSTARCH="$ARCHNAME"
