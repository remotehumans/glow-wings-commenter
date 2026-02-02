#!/bin/bash
# ABOUTME: Helper script to retrieve passwords from Vaultwarden
# ABOUTME: Usage: ./bw-get-password.sh "Item Name"

ITEM_NAME="$1"

if [ -z "$ITEM_NAME" ]; then
    echo "Usage: $0 <item-name>"
    echo "Example: $0 'Facebook - Amy Chen'"
    exit 1
fi

# Check if already logged in
if ! bw login --check &>/dev/null; then
    echo "Not logged in. Please run: bw login j350380787@gmail.com"
    exit 1
fi

# Unlock if needed and get session
if [ -z "$BW_SESSION" ]; then
    echo "Unlocking vault..."
    export BW_SESSION=$(bw unlock --raw 2>/dev/null)
    if [ -z "$BW_SESSION" ]; then
        echo "Failed to unlock vault. Check your master password."
        exit 1
    fi
fi

# Sync and get password
bw sync &>/dev/null
bw get password "$ITEM_NAME" --session "$BW_SESSION" 2>/dev/null
