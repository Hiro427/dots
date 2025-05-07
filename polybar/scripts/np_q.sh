#!/bin/bash

# Function to get now-playing information
enable_now_playing() {
    # Check if playerctl is installed
    if ! command -v playerctl &>/dev/null; then
        echo "playerctl not installed"
        exit 1
    fi

    # Get metadata
    title=$(playerctl metadata xesam:title 2>/dev/null)
    artist=$(playerctl metadata xesam:artist 2>/dev/null)

    # Return the now-playing info
    if [[ -n "$title" && -n "$artist" ]]; then
        echo "$title - $artist"
    elif [[ -n "$title" ]]; then
        echo "$title"
    else
        echo ""
    fi
}

# Function to get a random quote
get_rand_quote() {
    sqlite3 "$HOME/.quotes.db" <<EOF
.headers off
.mode list
SELECT '"' || content || '" - ' || character || ' / ' || anime
FROM quotes
WHERE (LENGTH(content) - LENGTH(REPLACE(content, ' ', ''))) + 1 <= 10
ORDER BY RANDOM()
LIMIT 1;
EOF
}

# Timer variables
quote_refresh_interval=120  # Time in seconds to refresh quotes
now_playing_refresh_interval=1  # Time in seconds to refresh now-playing
last_quote_time=0

# Main loop
while true; do
    current_time=$(date +%s)
    now_playing=$(enable_now_playing)

    if [[ -n "$now_playing" ]]; then
        # Print now-playing information if available
        echo "$now_playing"
    else
        # Check if it's time to refresh the quote
        if (( current_time - last_quote_time >= quote_refresh_interval )); then
            get_rand_quote
            last_quote_time=$current_time
        fi
    fi

    # Sleep for the now-playing interval
    sleep $now_playing_refresh_interval
done

