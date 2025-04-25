#!/bin/env bash

BIN="/usr/local/bin/"
FILE="$1"
EXT="${FILE##*.}"
BINARY_NO_EXT=${FILE%.*}
ALIAS="$2"



if [[ "$ALIAS" == "" ]]; then 
    BINARY="$BINARY_NO_EXT"
else 
    BINARY="$ALIAS"
fi 

move_file() {
    case "$EXT" in 
        sh)
            chmod +x "$FILE"
            sudo ln -s "$(pwd)/$FILE" "$BIN""$BINARY"
            ;;
        py)
            chmod +x "$FILE"
            sudo ln -s "$(pwd)/$FILE" "$BIN""$BINARY"
            ;;
        *)
            sudo ln -s "$(pwd)/$FILE" "$BIN""$FILE"
    esac
    echo "complete"
}


if ls "$BIN" | grep -q "$BINARY"; then 
    echo "Binary: '${BINARY}' already exists in '${BIN}'"
    read -p "Replace binary? (y/n): " choice

    case "$choice" in 
        y|Y)
            sudo rm "$BIN""$BINARY"
            move_file
            ;;
        n|N)
            exit 1
            ;;
    esac 
else 
    move_file
fi 



