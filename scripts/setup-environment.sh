#!/bin/bash

set -e

echo "Setting up build environment..."

# Install required packages
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm archiso git

# Create working directory
work_dir="/tmp/archiso-zfs"
sudo rm -rf "$work_dir"
sudo mkdir -p "$work_dir"

# Copy the releng profile
sudo cp -r /usr/share/archiso/configs/releng/ "$work_dir/custom"

echo "Build environment set up successfully."
