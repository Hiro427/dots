#!/bin/bash


case "$XDG_CURRENT_DESKTOP" in 
    "i3")

    TITLE=$(i3-msg -t get_tree | jq -r '.. | objects | select(.focused==true) | .name')
    CLASS=$(i3-msg -t get_tree | jq -r '.. | objects | select(.focused==true) | .window_properties.class'
    )

    case "$CLASS" in 
        "Spotify")
            echo " Spotify"
            ;;
        "zen")
            echo " Zen"
            ;;
        "LibreWolf")
            echo " Librewolf"
            ;;
        "Brave-browser")
            echo " Brave"
            ;;
        "org.wezfurlong.wezterm")
            case "$TITLE" in 
                "nvim")
                    echo " NeoVim"
                    ;;
                *)
                    echo " WezTerm"
                    ;;
            esac
            ;;
        "org.gnome.Nautilus")
            echo " Nautilus"
            ;;
        "vlc")
            echo "󰕼 VLC"
            ;;
        "discord")
            echo "  Discord"
            ;;
        *)
            echo ''
            ;;
    esac 
    ;;

"XFCE")
    echo ""

    ;;

esac 
