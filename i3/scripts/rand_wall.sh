#!/usr/bin/env bash


WALLPAPER_DIR=("$HOME/Pictures/gowall" "$HOME/wallpapers" "$HOME/.dotfiles/assets/catppuccin-wallpapers/")
SET_IMAGE="gsettings set org.gnome.desktop.background picture-uri-dark file:///"



main() {

    while true; do 

        image="$(find "${WALLPAPER_DIR[@]}" -maxdepth 3 -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" | fzf --height 40 --preview 'chafa --size=40x30 {}')"
        chafa "$image"

        tput civis

        read -rsn1 key

        if [[ "$key" == $'\e' ]]; then 
            read -rsn2 key 
        fi 

        case "$key" in 

            q|SIGINT)
                clear 
                tput cnorm 
                break
                exit
                ;;
            b)
                clear
                main
                ;;
            "")
                case $XDG_CURRENT_DESKTOP in 
                    GNOME)
                        eval "$SET_IMAGE${image}"
                        clear
                        tput cnorm
                        exit
                    ;;
                    i3)
                        feh --bg-fill "$image"
                        echo "$image" > ~/.dotfiles/i3/cur_wall.txt
                        clear
                        tput cnorm 
                        exit
                        ;;
                    *)
                        exit
                        ;;
                esac

                ;;
        esac 
    done 


}

main

