#!/bin/env bash


if pgrep systemd-inhibit > /dev/null; then
    pkill systemd-inhibit
    notify-send "󰾪 Caffeine OFF" "System can now sleep"
else
    systemd-inhibit --what=idle:sleep --why="Caffeine Mode" sleep 999999 &
    notify-send "󰅶 Caffeine ON" "System sleep is now blocked"
fi

