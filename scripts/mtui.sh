#!/bin/env bash

# Temp directory for album art
CACHE_DIR="/tmp/music-tui"
mkdir -p "$CACHE_DIR"
ART_PATH="$CACHE_DIR/album_art.jpg"

rm -f "$ART_PATH"


REFRESH_INTERVAL=30

display_music_info() {

    clear
    tput civis

    term_width=$(tput cols)
    term_height=$(tput lines)

    TEXT_PADDING=$(echo "$term_width / 2.9" | bc)
    IMG_PADDING=$(echo "$term_width / 2.9" | bc)
    VERT_PADDING=$(echo "$term_height / 4" | bc)

    # Fetch song details
    ARTIST=$(playerctl metadata artist 2>/dev/null)
    TITLE=$(playerctl metadata title 2>/dev/null)
    # ALBUM=$(playerctl metadata album 2>/dev/null)
    ALBUM_ART=$(playerctl metadata mpris:artUrl 2>/dev/null)

    padding_spaces=$(printf '%*s' "$TEXT_PADDING" "")

    # Download album art if it's a URL
    if [[ -n "$ALBUM_ART" ]]; then
        if [[ "$ALBUM_ART" == http* ]]; then
            wget -q "$ALBUM_ART" -O "$ART_PATH"
            ALBUM_ART="$ART_PATH"
        else
            ALBUM_ART=$(echo "$ALBUM_ART" | sed 's/^file:\/\///')  # Remove "file://" prefix
        fi
    fi

    tput cup "$((term_height / 7))" "$(echo "$term_width / 2.57" | bc)"

    echo -e "$(ct "#89b4fa" "  Now Playing  ")"

    tput cup "$VERT_PADDING" "$IMG_PADDING"

    if [[ -f "$ALBUM_ART" ]]; then

        chafa "$ALBUM_ART" --size=$((term_width / 2))x$((term_height / 2))
        tput civis
    fi

    if [[ -n "$ARTIST" && -n "$TITLE" ]]; then 
        if [[ ${#TITLE} -gt 35 ]]; then 
            title="${TITLE:0:20}..."
            tput cup "$(echo "$term_height / 1.3" | bc)" "$TEXT_PADDING"
            echo -e "\n${padding_spaces}$(ct "#b4befe" "$title")"
            echo -e "${padding_spaces}$(ct "#b4befe" "$ARTIST")"
        else
            tput cup "$(echo "$term_height / 1.3" | bc)" "$TEXT_PADDING"
            OUTPUT="$TITLE - $ARTIST"
            echo -e "\n${padding_spaces}$(ct "#b4befe" "󰲸 $TITLE")"
            echo -e "${padding_spaces}$(ct "#b4befe" " $ARTIST")"
        fi
    fi
}

display_music_info &

while true; do
    read -t "$REFRESH_INTERVAL" -n 1 key  # Wait for user input or timeout

    if [[ $key == "q" ]]; then
        tput cnorm
        clear
        break
    elif [[ $key == "r" ]]; then
        display_music_info
    else
        display_music_info
    fi
done
#

