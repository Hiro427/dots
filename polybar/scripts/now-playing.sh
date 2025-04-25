#!/bin/bash


# WIN_TITLE=$(i3-msg -t get_tree | jq -r '.. | objects | select(.focused==true) | .name')
#
# get_rand_quote() {
#     sqlite3 "$HOME/.quotes.db" <<EOF
# .headers off
# .mode list
# SELECT '"' || content || '" - ' || character || ' / ' || anime
# FROM quotes
# WHERE (LENGTH(content) - LENGTH(REPLACE(content, ' ', ''))) + 1 <= 10
# ORDER BY RANDOM()
# LIMIT 1;
# EOF
# }

# Get metadata
title=$(playerctl metadata xesam:title 2>/dev/null)
artist=$(playerctl metadata xesam:artist 2>/dev/null)
player_name=$(playerctl metadata --format '{{playerName}}')

case "$player_name" in
    "firefox"|"brave")
        if [[ -n "$title" ]]; then 
            if [[ "$title" == "Video - HIDIVE" ]]; then 
                url=$(playerctl metadata xesam:url 2>/dev/null) 
                hidive_title=$(curl -s "$url"| htmlq -t title 2>/dev/null)
                while [[ "$(playerctl metadata xesam:title 2>/dev/null)" == "Video - HIDIVE" ]]; do 
                    echo " $hidive_title"
                    sleep 2
                done
            elif echo "$title" | grep -q "Watch on Crunchyroll"; then 
                echo " $title" | cut -d'-' -f1
            else 
                echo " $title" | awk '{print (length($0) > 45 ? substr($0,1,42)"..." : $0)}'
            fi 
        else
            echo "Think, Different"
        fi

        ;;
    "vlc")
        vlc_title=$(basename "$(playerctl metadata xesam:url | sed 's|file://||g' | sed 's/%20/ /g')" | cut -f1 -d'.' | fold -w 40 -s)
        printf "󰕼 %s" "$vlc_title"
        ;;
    "spotify")
        echo " $title - $artist"
        ;;
    *)
        echo '"Think, Different"'
        ;;

esac


