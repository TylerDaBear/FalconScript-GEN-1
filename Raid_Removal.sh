#!/bin/bash

# Unmount the filesystem
sudo umount /dev/md125

# Stop the RAID devices
sudo mdadm --stop /dev/md125
sudo mdadm --stop /dev/md126
sudo mdadm --stop /dev/sda
sudo mdadm --stop /dev/sdb

# Remove the RAID devices
sudo mdadm --remove /dev/md125
sudo mdadm --remove /dev/md126

# Remove the superblocks
sudo mdadm --zero-superblock /dev/sda
sudo mdadm --zero-superblock /dev/sdb

# Reboot
sudo echo "please reboot before running Volume_Combination.sh"