#!/bin/bash

source "$HOME/coding/projects/bfetch/themes/catppuccin.sh"
source "$HOME/coding/projects/bfetch/functions.sh"
source "$HOME/coding/projects/bfetch/plugins.sh"


# $(display "$red" " pc"): $(display "$subtext0" "$(getPCModel)")
# $(display "$blue" " mem"): $(display "$subtext0" "$(getMemoryInfo)")
# $(display "$lavender" " shell"): $(display "$subtext0" "$(getShellVersion)")
# $(display "$rosewater" " kernel"): $(display "$subtext0" "$(getKernelVersion)")


color_box="$maroon"

top_border=$(display "$color_box" "╔════════╗")
bottom_border=$(display "$color_box" "╚════════╝")
vertical_line=$(display "$color_box" "║")

info=$(cat <<EOF | column -t -s ':'
$top_border:
$vertical_line$(display "$yellow" " user  ") $vertical_line: $(display "$subtext0" "$(getUser)")
$vertical_line$(display "$peach" " uptime") $vertical_line: $(display "$subtext0" "$(getUptime)")
$vertical_line$(display "$mauve" " os    ") $vertical_line: $(display "$subtext0" "$(getOS)")
$vertical_line$(display "$sky" " pkgs  ") $vertical_line: $(display "$subtext0" "$(getNumPkg)")
$vertical_line$(display "$teal" " kernel") $vertical_line: $(display "$subtext0" "$(getShellVersion)")
$vertical_line$(display "$sky" " mem   ") $vertical_line: $(display "$subtext0" "$(getMemoryInfo)")

$bottom_border:
EOF
)


ascii="$HOME/coding/projects/bfetch/ascii/debian.txt"
ascii_color=$(hex_to_ansi "$red")

display_ascii "$ascii_color" "$info" "$ascii" "left"


