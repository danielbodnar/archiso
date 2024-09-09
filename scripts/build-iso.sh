#!/bin/bash

set -e

echo "Building custom Arch Linux ISO with ZFS support..."

work_dir="/tmp/archiso-zfs"
custom_profile="$work_dir/custom"
out_dir="$PWD/out"

# Create output directory
mkdir -p "$out_dir"

# Build the ISO
sudo mkarchiso -v -w "$work_dir" -o "$out_dir" "$custom_profile"

echo "ISO build complete. You can find the ISO in the $out_dir directory."
