#!/bin/env bash

CACHE_DIR=""
NOW_PLAYING=""


cleanup() {
    rm "${CACHE_DIR}/*"
}

now_playing() {
    local title 
    local artist 



}


while true; do 
    tput civis 
    clear
    read -rsn1 key  
    if [[ "$key" == $'\e' ]]; then 
        read -rsn2 key 
    fi 

    case "$key" in 
        e)
            echo "hello"
            ;;

        l)
            echo "lello"
            ;;
        *)
            exit 
            ;;
    esac 
done
