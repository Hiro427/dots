#!/bin/bash

FILE="$HOME/.zsh_history"

cat "$FILE" | cut -d';' -f2 | gum filter --reverse | wl-copy  

wl-paste
