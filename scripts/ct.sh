#!/bin/bash



header_color="$1"
header="$2"

a_r=$((16#${header_color:1:2}))
a_g=$((16#${header_color:3:2}))
a_b=$((16#${header_color:5:2}))

echo -e "\e[38;2;${a_r};${a_g};${a_b}m${header}\e[0m"
