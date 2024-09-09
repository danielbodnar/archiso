#!/bin/bash

set -e

echo "Adding ZFS support to the ISO..."

work_dir="/tmp/archiso-zfs"
custom_profile="$work_dir/custom"

# Add archzfs repository to pacman.conf
sudo sed -i '/\[multilib\]/i [archzfs]\nServer = https://archzfs.com/$repo/$arch\n' "$custom_profile/pacman.conf"

# Create a script to load ZFS module during boot
cat << EOF | sudo tee "$custom_profile/airootfs/root/zfs-load.sh"
#!/bin/bash
modprobe zfs
zpool import -a
EOF

sudo chmod +x "$custom_profile/airootfs/root/zfs-load.sh"

# Modify customize_airootfs.sh to run the ZFS loading script
sudo sed -i '/systemctl enable pacman-init.service/a systemctl enable zfs-load.service' "$custom_profile/airootfs/root/customize_airootfs.sh"

# Create a systemd service to load ZFS module
cat << EOF | sudo tee "$custom_profile/airootfs/etc/systemd/system/zfs-load.service"
[Unit]
Description=Load ZFS module
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/root/zfs-load.sh

[Install]
WantedBy=multi-user.target
EOF

echo "ZFS support added successfully."
