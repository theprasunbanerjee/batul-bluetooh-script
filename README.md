# 🦷 Batul — Bluetooth Auto-Scanner

A lightweight Bash script that automates Bluetooth scanning and pairing on Linux.  
No GUI needed — run it in the terminal and it handles the rest.

---

## ✨ What It Does

1. Checks for root privileges (required for `bluetoothctl`).
2. Powers on the Bluetooth adapter.
3. Starts scanning for nearby devices.
4. Lists discovered devices with numbers so you can pick one to pair.
5. Handles pairing and connection automatically.

---

## 🚀 How to Run

```bash
git clone https://github.com/theprasunbanerjee/batul-bluetooh-script.git
cd batul-bluetooh-script

# Install dependencies (one-time)
chmod +x install.sh && sudo ./install.sh

# Run the scanner
sudo ./batul.sh
```

---

## 📋 Requirements

- Linux (tested on Ubuntu / Debian)
- `bluetoothctl` (part of `bluez` package)
- Root / sudo access

---

## 🛠️ Tech Stack

- Bash shell script
- `bluetoothctl` (BlueZ)

---

## 👨‍💻 Author

**Prasun Banerjee** — [github.com/theprasunbanerjee](https://github.com/theprasunbanerjee)
