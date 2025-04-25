#!/bin/bash

if [[ $# -eq 0 ]]; then  
    # selected=$(fzf --header="File Selector: Navigate using arrow keys, press Enter to select." \
    #            --prompt="Your choice > " \
    #            --preview 'bat --style=numbers --color=always --line-range :500 {}' \
    #            --border \
    #            --height 30% \
    #            --layout reverse)
    selected=$(ls | gum filter)
else 
    selected=$1
fi

extension=$(echo "$selected" | awk -F. '{print "."$NF}')

case "$extension" in
.go)
    go run "$selected"
    ;;
.rs)
    cargo run "$selected"
    ;;
.py)
    python3 "$selected"
    ;;
.sh)
    bash "$selected"
    ;;
.java)
    java "$selected"
    ;;
.c)
    exe=$(basename "$selected" .c) 
    gcc "$selected" -o "$exe"
    ./"$exe"
    ;;
.lua) 
    lua "$selected"
    ;;
.ts)
    tsc "$selected"
    node "${selected%.*}.js"
    ;;
.js)
    node "$selected"
    ;;
*)
    echo "not a valid option"
    ;;
esac
