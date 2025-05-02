#!/usr/bin/env bash


#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# Current Theme
dir="$HOME/.config/rofi/"
theme='power'

# CMDs
uptime="$(uptime | awk -F ' ' '{ print $1 }')"

# Options
shutdown='⭘'
reboot=''
lock=''
suspend='󰒲'
logout='󰍃'
yes=''
no='󰬟'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Goodbye Jacob" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/shared/confirm.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
        systemctl poweroff 
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        i3lock -c 000000
        ;;
    $suspend)
        i3lock -c 000000 && systemctl suspend
        ;;
    $logout)
        i3-msg exit
        ;;
esac

