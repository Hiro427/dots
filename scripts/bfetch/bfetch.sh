#!/bin/bash

source "$HOME/.config/bfetch/config.sh"

case "$1" in
    -cc)
        cache="$HOME/.config/bfetch/tmp_cache.txt"
        echo -n > "$cache"
        echo "cleared cache"
        ;;
    ls) 
        ls "$ASCII_DIR"
        ;;
    -art) 
        if [[ -n "$2" ]]; then 
            config "$2" "$3" 
        else 
            if [[ -n "$ASCII" ]]; then 
                config "$ASCII"
            fi
        fi
        ;;
    -aa)
        echo "$2" > "$ASCII_DIR/$3.txt"
        ;;
    -i)

        ;;
    -h)
        echo "$helper"
        ;;
    *) 
        config
        ;;
esac





