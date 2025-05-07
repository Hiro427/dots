#!/bin/bash

LOG_FILE="$HOME/.caffeine.log"
# TEMP="$HOME/.caffiene.pid"

# Ensure the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "off" > "$LOG_FILE"  # Default state is 'off'
fi

# Function to enable caffeine (prevent sleep)
# Function to enable caffeine (prevent sleep)
enable_caffeine() {
    # Disable sleep and screen blanking
    gsettings set org.gnome.desktop.session idle-delay 0
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
    echo "on" >> "$LOG_FILE"
}

# Function to disable caffeine (allow sleep)
disable_caffeine() {
    # Re-enable sleep and screen blanking (default settings)
    gsettings set org.gnome.desktop.session idle-delay 300
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'suspend'
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'suspend'
    echo "off" >> "$LOG_FILE"
}

# Function to check the current state
check_state() {
    LAST_STATE=$(tail -n 1 "$LOG_FILE")
    if [ "$LAST_STATE" == "on" ]; then
        echo "%{F#A6E3A1}󰅶 %{F-}"
    else
        echo "%{F#F38BA8}󰾪 %{F-}"
    fi
}

# Main logic for handling flags
case "$1" in
    --on)
        enable_caffeine
        ;;
    --off)
        disable_caffeine
        ;;
    *)
        check_state
        ;;
esac

