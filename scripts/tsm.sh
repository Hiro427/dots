#!/bin/env bash

find_dirs() {

find "$HOME/coding/" -mindepth 1 -maxdepth 3 -type d \( \
     -name ".venv" -o -name "__pycache__" -o -name ".git" -o -name ".gitignore" \
    \) -prune -o -type d -print
}



main () {
    directories=$(find_dirs)

    sel_dir=$(echo "$directories" | gum filter --placeholder="Select Project" --no-sort --no-fuzzy --reverse --height=20)

    eval sesh connect "$sel_dir"
}


main
