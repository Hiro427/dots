#!/bin/bash

# Check if a wired connection is active
WIRED_INTERFACE=$(ip link | grep -E 'state UP' | grep -Eo '^[0-9]+: [^:]*' | awk -F': ' '{print $2}' | grep -E '^en')

if [ -n "$WIRED_INTERFACE" ]; then
    # Display the wired connection interface name
    echo "󰈀 wired"
else
    # Check if a Wi-Fi connection is active
    WIFI_SSID=$(iwgetid -r)
    if [ -n "$WIFI_SSID" ]; then
        echo "󰖩 $WIFI_SSID"
    else
        # No active network connection
        echo "󱚼"
    fi
fi


