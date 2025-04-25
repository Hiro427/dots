#!/bin/bash

source "$HOME/coding/projects/bfetch/themes/catppuccin.sh"
source "$HOME/coding/projects/bfetch/functions.sh"
source "$HOME/coding/projects/bfetch/plugins.sh"

hostname_prefix=$(display "$teal" " user")
hostname_i=$(display "$subtext0" "$(getUser)")

uptime_prefix=$(display "$peach" " uptime")
uptime_i=$(display "$subtext0" "$(getUptime)")

os_prefix=$(display "$blue" " os")
os_i=$(display "$subtext0" "$(getOS)")

shell_prefix=$(display "$lavender" " shell")
shell_i=$(display "$subtext0" "$(getShellVersion)")

pc_prefix=$(display "$red" " pc")
pc_i=$(display "$subtext0" "$(getPCModel)")

kernel_prefix=$(display "$rosewater" " kernel")
kernel_i=$(display "$subtext0" "$(getKernelVersion)")

memory_prefix=$(display "$blue" " mem")
memory_i=$(display "$subtext0" "$(getMemoryInfo)") 

pkg_prefix=$(display "$sky" " pkgs")
pkg_i=$(display "$subtext0" "$(getNumPkg)")

main() {
info=$(cat <<EOF | column -t -s ':' 
$hostname_prefix: $hostname_i
$os_prefix: $os_i
$uptime_prefix: $uptime_i
$shell_prefix: $shell_i
$pc_prefix: $pc_i
$kernel_prefix: $kernel_i
$memory_prefix: $memory_i
$pkg_prefix: $pkg_i
EOF
)


ascii="$HOME/coding/projects/bfetch/ascii/linux.txt"
ascii_color=$(hex_to_ansi "$sky")

display_ascii "$ascii_color" "$info" "$ascii" "top"

}

main
