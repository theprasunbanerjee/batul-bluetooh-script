#!/bin/bash

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)."
  exit 1
fi

# Turn on Bluetooth
bluetoothctl power on

# Sleep for a moment to ensure Bluetooth is powered on before scanning
sleep 2

# Start scanning for devices
bluetoothctl scan on &

# Display a message indicating that the scan has started
echo "Bluetooth scan initiated. Press Ctrl+C to stop the scan."

# Keep the script running to allow scanning until interrupted
trap 'echo "Stopping Bluetooth scan..."; bluetoothctl scan off; exit 0' INT

# Wait for devices to be discovered and display them with numbers
sleep 5  # You can adjust this duration based on your needs

devices_info=($(bluetoothctl devices | awk '{print $2, $3}'))
num_devices=${#devices_info[@]}

if [ "$num_devices" -eq 0 ]; then
  echo "No devices found."
  exit 0
fi

echo "Found devices:"
for ((i = 0; i < num_devices; i+=2)); do
  index=$((i / 2 + 1))
  mac_address="${devices_info[i]}"
  device_name="${devices_info[i + 1]}"
  echo "$index. $device_name ($mac_address)"
done

# Ask the user to choose a device to pair with
read -p "Enter the number of the device to pair with (or press Enter to stop scanning): " choice

if [ -n "$choice" ]; then
  if [ "$choice" -ge 1 ] && [ "$choice" -le "$((num_devices / 2))" ]; then
    selected_device="${devices_info[(choice - 1) * 2]}"
    echo "Pairing with device: $selected_device"
    bluetoothctl pair "$selected_device"
  else
    echo "Invalid choice. Exiting."
  fi
fi
