#!/usr/bin/env bash


sleep 1
scrot /tmp/currentworkspace.png
magick /tmp/currentworkspace.png -blur 10x20 /tmp/lockbackground.png
# composite -gravity east $overlay /tmp/currentworkspaceblur.png /tmp/lockbackground.png
rm /tmp/currentworkspace.png
i3lock -i /tmp/lockbackground.png
