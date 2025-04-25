#!/bin/bash

source "$HOME/.config/bfetch/themes/catppuccin.sh"
source "$HOME/.config/bfetch/functions.sh"
source "$HOME/.config/bfetch/plugins.sh"

ASCII_DIR="$HOME/.config/bfetch/ascii"
ASCII_COLOR=$lavender
DEFAULT_ASCII="gojo2"




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

top_border=$(display "$lavender" "┌─────────────────────$title──────────────────────────┐")
divider="├──────────────────────────────────────────────────────────┤"
bottom_border=$(display "$lavender" "└──────────────────────────────────────────────────────────┘")

separator=" 󰄾"
separator2=""

info=$(cat <<EOF
$top_border
$(display "$peach" " 󰢹 ")$separator $separator2$(display "$subtext0" "Dell $(getPCModel)")
$(display "$yellow" "  ")$separator $separator2$(display "$subtext0" "$(getKernelVersion)")
$(display "$mauve" "  ")$separator $separator2$(display "$subtext0" "$(getOS)")
$(display "$text" "  ")$separator $separator2$(display "$subtext0" "$(gnome-shell --version | awk '{ print $1 " " $3 }')")
$(display "$lavender" " 󰃰 ")$separator $separator2$(display "$subtext0" "$(getUptime)")
$(display "$sky" " 󰺏 ")$separator $separator2$(display "$subtext0" "$(getLastUpdate)")
$(display "$lavender" "$divider")
$(display "$yellow" "  ")$separator $separator2$(display "$subtext0" "$(getCPU)")
$(display "$lavender" "  ")$separator $separator2$(display "$subtext0" "$(getiGPU)")
$(display "$sky" " 󰺵 ")$separator $separator2$(display "$subtext0" "NVIDIA $(getGPU)")
$(display "$blue" "  ")$separator $separator2$(display "$subtext0" "$(getMemoryInfo)")
$(display "$lavender" "$divider")
$(display "$sapphire" "  ")$separator $separator2$(display "$subtext0" "$TERM_PROGRAM")
$(display "$lavender" "  ")$separator $separator2$(display "$subtext0" "$(getShellVersion)")
$(display "$peach" "  ")$separator $separator2$(display "$subtext0" "$(getNumPkg)")
$(display "$red" "  ")$separator $separator2$(display "$subtext0" "$(gitCheck)")
$(display "$lavender" "$divider")
$(display "$subtext1" " 󰓃 ")$separator $separator2$(display "$subtext0" "$(getNowPlaying)")
$(display "$subtext1" "  ")$separator $separator2$(display "$subtext0" "$(getPulseAudioLevel)")
$(display "$mauve" "  ")$separator $separator2$(display "$subtext0" "$(getTheme)")
$(display "$yellow" " 󰳲 ")$separator $separator2$(display "$subtext0" "$(getBrightness)")
$(display "$mauve" " 󱀡 ")$separator $separator2$(display "$subtext0" "$(getRandQuote)")
$bottom_border
EOF
)
ascii_art="$ASCII_DIR/$1.txt"
ascii_color=$(hex_to_ansi "$ASCII_COLOR")

display_ascii "$ascii_color" "$info" "$ascii_art" "$2"

}




