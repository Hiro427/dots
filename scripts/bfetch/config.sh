#!/bin/bash

source "$HOME/.config/bfetch/themes/catppuccin.sh"
source "$HOME/.config/bfetch/functions.sh"
source "$HOME/.config/bfetch/plugins.sh"

ASCII_DIR="$HOME/.config/bfetch/ascii"
ASCII_COLOR=$lavender
DEFAULT_ASCII="linux"




helper=$(cat <<EOF | column -t -s '|'

$(display "$sky" "Flag|Command|Example|Notes")

$(display "$subtext0" '-aa|Add ASCII|bfetch -aa "<paste-ascii-here>" "<name>"|no ".txt" in name
ls|List ASCII|bfetch ls|---
-art|Choose ASCII|bfetch -art "gojo2" "right"|(right, left, bottom, top) 
-cc|Clear Cache|bfetch -cc|(GPU, NumPkg,etc) stored to save time"')
EOF
)


config() {

title="System-Info"

# top_border=$(display "$lavender" "┌─────────────────────$title──────────────────────────┐")
# divider="├──────────────────────────────────────────────────────────┤"
# bottom_border=$(display "$lavender" "└──────────────────────────────────────────────────────────┘")
#
#$(display "$green" "  ")$separator $separator2$(display "$subtext0" "$(getFileCounts)")
check_hostname=$(hostname)

case "$check_hostname" in 
    debian)
        distro_icon="  "
        ;;
    fedora)
        distro_icon="  "
        ;;
    opensuse)
        distro_icon="  "
        ;;
    arch)
        distro_icon=" 󰣇 "
        ;;
esac 
separator=" 󰄾"
separator2=""

info=$(cat <<EOF
$(echo " ")
$(display "$lavender" " $(getUser)")
$(display "$peach" " 󰢹 ")$separator $separator2$(display "$subtext0" "$(getPCModel)")
$(display "$yellow" "  ")$separator $separator2$(display "$subtext0" "$(getKernelVersion)")
$(display "$mauve" "$distro_icon")$separator $separator2$(display "$subtext0" "$(getOS)")
$(display "$red" "  ")$separator $separator2$(display "$subtext0" "$(gitCheck)")
EOF
)
ascii_art="$ASCII_DIR/$1.txt"
ascii_color=$(hex_to_ansi "$ASCII_COLOR")

if [[ "$1" == "none" ]]; then
    echo "$info"
else 
    display_ascii "$ascii_color" "$info" "$ascii_art" "$2"
fi 


}




