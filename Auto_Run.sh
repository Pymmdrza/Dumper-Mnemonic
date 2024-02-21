#!/bin/bash

# Check if Python3 and pip3 are installed
if ! command -v python3 &> /dev/null || ! command -v pip3 &> /dev/null; then
    # Install Python3 and pip3
    echo "Python3 or pip3 is not installed. Installing Python3..."
    sudo apt update
    sudo apt install -y python3 python3-pip
fi

# Install required packages using pip3
echo "Installing required packages using pip3..."
pip3 install requests colorthon cryptofuzz

PYTHON_SCRIPT_URL=https://raw.githubusercontent.com/Pymmdrza/Dumper-Mnemonic/mainx/DumperMnemonic.py
DOWNLOAD_PATH=DumperMnemonic.py

# Downloading file using curl
echo "Downloading file..."
curl -o $DOWNLOAD_PATH $PYTHON_SCRIPT_URL

# Check if download operation is successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to download the file."
    exit 1
fi

# Running Python3 script
echo "Running Python3 script..."
python3 $DOWNLOAD_PATH
