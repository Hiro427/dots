#!/bin/env bash

CHT_DIR="$HOME/coding/resources/"

selected=$(ls "$CHT_DIR" | gum filter)

if [[ "${selected##*.}" == "md" ]]; then 
    glow --pager "$CHT_DIR$selected"
else 
    nvim "$CHT_DIR$selected"
fi


