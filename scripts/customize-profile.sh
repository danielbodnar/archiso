#!/bin/bash

set -e

echo "Customizing ISO profile..."

work_dir="/tmp/archiso-zfs"
custom_profile="$work_dir/custom"

# Copy custom package list
sudo cp configs/packages.x86_64 "$custom_profile/packages.x86_64"

# Copy custom pacman.conf
sudo cp configs/pacman.conf "$custom_profile/pacman.conf"

# Modify profiledef.sh
sudo sed -i 's/iso_name="archlinux"/iso_name="archlinux-zfs"/' "$custom_profile/profiledef.sh"
sudo sed -i 's/iso_label="ARCH_$(date +%Y%m)"/iso_label="ARCH_ZFS_$(date +%Y%m)"/' "$custom_profile/profiledef.sh"

echo "ISO profile customized successfully."
