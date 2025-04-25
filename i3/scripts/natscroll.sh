#!/usr/bin/env bash
case $(hostname) in 
    nixos)
        MOUSE_ID=$(xinput list | \
            grep "Logitech" | \
            grep "pointer" | \
            awk -F '=' '{ print $2 }' | \
            awk '{ print $1 }')

        SETTING_ID=$(xinput list-props "$MOUSE_ID" | \
            grep "Natural Scrolling" | \
            grep -v "Default"| \
            awk -F '[()]' '{ print $2 }')

        xinput set-prop "$MOUSE_ID" "$SETTING_ID" 1
        ;;
esac 
