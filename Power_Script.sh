#!/bin/bash

# Create or edit /etc/acpi/events/power-button file
echo "event=button/power*" | sudo tee /etc/acpi/events/power-button > /dev/null
echo "action=/etc/acpi/events/power-button.sh %e" | sudo tee -a /etc/acpi/events/power-button > /dev/null

# Create or edit /etc/acpi/events/power-button.sh file
echo "#! /bin/sh" | sudo tee /etc/acpi/events/power-button.sh > /dev/null
echo "poweroff" | sudo tee -a /etc/acpi/events/power-button.sh > /dev/null

# Give execute permission to the script
sudo chmod +x /etc/acpi/events/power-button.sh

echo "Configuration completed. You can now test the power button setup."
echo "Please reboot."
echo "To test the power settings after reboot: Unplug the Falcon's power cable on log in screen."