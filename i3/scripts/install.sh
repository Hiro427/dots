#!/bin/bash

if [[ $(hostname) == "debian" ]]; then  
    sudo apt update

    sudo apt install brightnessctl lightdm xautolock
else 
    echo "Hello"
fi




#apps 
scrot 
magick 
dmenu 
rofi 
i3-gaps 
picom 
autotiling #rust
