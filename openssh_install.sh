#!/bin/bash

# Check if OpenSSH is already installed
if ! command -v ssh &> /dev/null; then
    echo "OpenSSH is not installed. Installing..."

    # Update the package manager
    sudo apt update

    # Install OpenSSH
    sudo apt install -y openssh-server
else
    echo "OpenSSH is already installed."
fi

# Enable and start the OpenSSH service
sudo systemctl enable ssh
sudo systemctl start ssh

# Check the status of the OpenSSH service
if systemctl is-active --quiet ssh; then
    echo "OpenSSH is installed and running."
else
    echo "Failed to start OpenSSH. Please check your system configuration."
fi
