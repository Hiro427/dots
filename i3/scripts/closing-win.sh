#!/usr/bin/env bash

# Get the active window's class name
active_window_class=$(xdotool getwindowfocus getwindowclassname)

if [[ "$active_window_class" == "LibreWolf" ]]; then
    pkill -TERM librewolf
else
    i3-msg kill
fi
