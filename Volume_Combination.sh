#!/bin/bash

# Create a partition as Linux LVM
# Replace /dev/sda with your drive
sudo fdisk /dev/sda <<EOF
d
1
n
p
1

t
8e
w
EOF

# Install LVM and load the LVM module
sudo apt-get install lvm2
sudo modprobe dm-mod

# Add dm-mod to /etc/modules
echo "dm-mod" | sudo tee -a /etc/modules

# Set up the first LVM
sudo vgscan
sudo vgchange -a y
sudo pvcreate /dev/sda
sudo vgcreate md125 /dev/sda
sudo lvcreate -l 100%FREE -narchives md125
sudo mke2fs -t ext4 /dev/md125/archives

# Mount the volume
sudo mkdir /archives
sudo mount /dev/md125/archives /archives

# Add an entry to /etc/fstab
echo "/dev/md125/archives /archives ext4 defaults 0 1" | sudo tee -a /etc/fstab

# Adding another drive to your volume
sudo vgextend md125 /dev/sdb
sudo umount /dev/md125/archives

# Resize the LVM volume
sudo lvextend -L+465G /dev/md125/archives
sudo e2fsck -f /dev/md125/archives
sudo resize2fs /dev/md125/archives

# Remount the volume
sudo mount /dev/md125/archives /archives

echo "RAID removal, LVM setup, and drive addition completed."

# Reboot (if needed)
echo "check disks and archives mount location."
echo "Please Reboot."