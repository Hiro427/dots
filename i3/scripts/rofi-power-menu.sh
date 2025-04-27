#!/usr/bin/bash

# Options for the power menu
options=" Lock\n Logout\n Reboot\n Shutdown\n Suspend"

# Show the power menu in Rofi and capture the user's choice
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu:" -theme-str '#window { width: 20%; }')

# Execute the corresponding command based on the user's choice
case "$chosen" in
    " Lock")
        # Replace with your lock screen command
        i3lock -i ~/wallpapers/cold-alley.png
        ;;
    " Logout")
        # Replace with the appropriate logout command for your desktop environment
        i3-msg exit
        ;;
    " Reboot")
       systemctl reboot
        ;;
    " Shutdown")
        systemctl poweroff
        ;;
    " Suspend")
        # light-locker-command -l && systemctl suspend 
        i3lock -i ~/wallpapers/cold-alley.png && systemctl suspend
        ;;
    *)
        # Exit if no option is chosen
        exit 0
        ;;
esac


