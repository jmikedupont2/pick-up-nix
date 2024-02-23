#!/bin/sh

# This script installs the Nix package manager on your system by
# downloading a binary distribution and running its installer script
# (which in turn creates and populates /nix).

{ # Prevent execution if this script was only partially downloaded
oops() {
    echo "$0:" "$@" >&2
    exit 1
}

umask 0022

#mkdir /tmp/nix

tmpDir=/tmp/nix
#cleanup() {
#    rm -rf "$tmpDir"
#}
#trap cleanup EXIT INT QUIT TERM

require_util() {
    command -v "$1" > /dev/null 2>&1 ||
        oops "you do not have '$1' installed, which I need to $2"
}

case "$(uname -s).$(uname -m)" in
    Linux.x86_64)
        hash=b7c527e238241da4dd8f6f3818ecae2626d0478e784b5f3ff93a3f4dee678f66
        path=vrgfmv4nkac0jn6sy86xn04dzyl4z2rg/nix-2.20.3-x86_64-linux.tar.xz
        system=x86_64-linux
        ;;
    Linux.i?86)
        hash=7e11e8bcaab5a49bea12de184f49b7b7eed89119c278767a1785ec633f260d17
        path=yph74ni8v7rx5hnx79q9lid09mi934f4/nix-2.20.3-i686-linux.tar.xz
        system=i686-linux
        ;;
    Linux.aarch64)
        hash=3d7a2299195060c2a981e1469a96e784e4cbe9f02482b7b7f35f624b5a81f815
        path=zywl9xhzg5gbpyxbk7wb1f4df7r7mq2k/nix-2.20.3-aarch64-linux.tar.xz
        system=aarch64-linux
        ;;
    Linux.armv6l)
        hash=15e8b9fe30f8a9bdace526c4e0b3b697226b763ad10fb00dab86888b2cf28423
        path=0lakhhqh5fgbi0zab4zvzqsfrw7xrq52/nix-2.20.3-armv6l-linux.tar.xz
        system=armv6l-linux
        ;;
    Linux.armv7l)
        hash=fe30dcfb9c1cc4b99c4e3c5f7a73be6cf765dcb0fbd481ba1e6cc14578758d7f
        path=h7i80kzc5wrnjfkg8n2nv70w4w56bjx1/nix-2.20.3-armv7l-linux.tar.xz
        system=armv7l-linux
        ;;
    Darwin.x86_64)
        hash=3cfd18a6ca25065bed47e9cea50e3223bc164d2333d233ee3172042efe01523a
        path=czb0dk21qsn44brayqgclq6dgx6psvnr/nix-2.20.3-x86_64-darwin.tar.xz
        system=x86_64-darwin
        ;;
    Darwin.arm64|Darwin.aarch64)
        hash=ca454c95ccb35953331eead2863d856e23730b610677aa88a6d54d784bd34f17
        path=0mryk0v7clx9cv9d30ysr9da1v31r4an/nix-2.20.3-aarch64-darwin.tar.xz
        system=aarch64-darwin
        ;;
    *) oops "sorry, there is no binary distribution of Nix for your platform";;
esac

# Use this command-line option to fetch the tarballs using nar-serve or Cachix
if [ "${1:-}" = "--tarball-url-prefix" ]; then
    if [ -z "${2:-}" ]; then
        oops "missing argument for --tarball-url-prefix"
    fi
    url=${2}/${path}
    shift 2
else
    url=https://releases.nixos.org/nix/nix-2.20.3/nix-2.20.3-$system.tar.xz
fi

tarball=$tmpDir/nix-2.20.3-$system.tar.xz

require_util tar "unpack the binary tarball"
if [ "$(uname -s)" != "Darwin" ]; then
    require_util xz "unpack the binary tarball"
fi

fetch( )
{
    echo ok
}
#if command -v curl > /dev/null 2>&1; then
#    fetch() { curl --fail -L "$1" -o "$2"; }
#elif command -v wget > /dev/null 2>&1; then
#    fetch() { wget "$1" -O "$2"; }
#else
#    oops "you don't have wget or curl installed, which I need to download the binary tarball"
#fi

#echo "downloading Nix 2.20.3 binary tarball for $system from '$url' to '$tmpDir'..."
#fetch "$url" "$tarball" || oops "failed to download '$url'"

# if command -v sha256sum > /dev/null 2>&1; then
#     hash2="$(sha256sum -b "$tarball" | cut -c1-64)"
# elif command -v shasum > /dev/null 2>&1; then
#     hash2="$(shasum -a 256 -b "$tarball" | cut -c1-64)"
# elif command -v openssl > /dev/null 2>&1; then
#     hash2="$(openssl dgst -r -sha256 "$tarball" | cut -c1-64)"
# else
#     oops "cannot verify the SHA-256 hash of '$url'; you need one of 'shasum', 'sha256sum', or 'openssl'"
# fi

# if [ "$hash" != "$hash2" ]; then
#     oops "SHA-256 hash mismatch in '$url'; expected $hash, got $hash2"
# fi

# unpack=$tmpDir/unpack
# mkdir -p "$unpack"
# tar -xJf "$tarball" -C "$unpack" || oops "failed to unpack '$url'"

script=$(echo "$unpack"/*/install)

[ -e "$script" ] || oops "installation script is missing from the binary tarball!"
export INVOKED_FROM_INSTALL_IN=1
"$script" "$@"

} # End of wrapping
