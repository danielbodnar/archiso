#!/bin/bash

set -e

# Main script to build custom Arch Linux ISO with ZFS support

echo "Starting custom Arch Linux ISO build process with ZFS support..."

# Step 1: Set up the build environment
./scripts/setup-environment.sh

# Step 2: Create a custom profile based on releng
./scripts/customize-profile.sh

# Step 3: Add ZFS support
./scripts/add-zfs-support.sh

# Step 4: Build the ISO
./scripts/build-iso.sh

echo "Custom Arch Linux ISO with ZFS support has been built successfully!"
echo "You can find the ISO in the out/ directory."
echo "Please refer to the README.md file for testing and usage instructions."
