#!/usr/bin/env bash


PCMODEL=$(cat "/sys/class/dmi/id/product_name")

if echo "XPS" | grep -n "$PCMODEL"; then
  xrandr --auto
else
    xrandr --output DP-2 --primary --mode 1920x1080 --rotate normal --below DP-3 \
        --output eDP-1 --off
fi

# if [[ "$HOSTNAME" == "nixos" ]]; then 
#     xrandr --output DP-2 --primary --mode 1920x1080 --rotate normal \
#         --output eDP-1 --off
# fi 

