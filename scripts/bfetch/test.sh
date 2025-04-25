#!/bin/bash

getRandQuote() {
    RESULT=$(sqlite3 "$HOME/.quotes.db" "select content, anime, character from quotes where length(content) <= 35 order by random() limit 1")
    if [[ -n "$RESULT" ]]; then 
        IFS='|' read -r QUOTE ANIME CHAR <<< "$RESULT"
        printf "%s\n" "$QUOTE"
        printf "\n%-20s - %s\n" "$CHAR" "($ANIME)"
    else 
        echo "no quote found"
    fi

}

getRandQuote
