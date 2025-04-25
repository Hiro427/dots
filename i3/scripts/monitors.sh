#!/usr/bin/env bash


HOSTNAME=$(hostname)


if [[ "$HOSTNAME" == "nixos" ]]; then 
    xrandr --output DP-3 --mode 1920x1080 --rotate normal \
        --output DP-2 --primary --mode 1920x1080 --rotate normal --below DP-3 \
        --output eDP-1 --off
fi 

