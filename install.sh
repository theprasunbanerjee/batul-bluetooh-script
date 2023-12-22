#!/bin/bash

# Destination directory for the script
DEST_DIR="/usr/local/bin/"
SCRIPT_NAME="batul.sh"

# Guide on how to use the script
GUIDE_MESSAGE="
batul.sh Installation Complete!

To use the Bluetooth scan and pair script:
1. Open a terminal.
2. Type 'batul' and press Enter.
3. Follow the on-screen instructions to scan and pair Bluetooth devices.

Note: Make sure Bluetooth is enabled on your system.

For more details, check the script documentation at: <link-to-your-documentation>
"

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)."
  exit 1
fi

# Copy the script to the destination directory
cp "$SCRIPT_NAME" "$DEST_DIR"
chmod +x "${DEST_DIR}${SCRIPT_NAME}"

# Display installation messages
echo "Installing $SCRIPT_NAME to $DEST_DIR..."
echo "Setting execute permissions..."

# Display guide on how to use the script
echo "$GUIDE_MESSAGE"
