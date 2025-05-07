#!/bin/env bash


if pgrep systemd-inhibit > /dev/null; then
    echo "󰅶"
else
    echo "󰾪"
fi

