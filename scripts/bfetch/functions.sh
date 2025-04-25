#!/bin/bash

hex_to_ansi() {
    # Extract the R, G, B values from the hex color
    hex_color=$1
    r=$((16#${hex_color:1:2})) 
    g=$((16#${hex_color:3:2}))
    b=$((16#${hex_color:5:2}))

    # Generate the ANSI escape code
    printf "\033[38;2;%d;%d;%dm" "$r" "$g" "$b"
}

check_command() {
    if ! command -v "$1" &> /dev/null; then
        echo "$1 is NOT installed"
        return 1
    else
        echo "$1 is installed"
        return 0
    fi
}




display_ascii() {
    
    local ascii_color="$1"
    local data="$2"
    local ascii="$3"
    local location="$4"

    case $location in 
        top) 
            mawk -v art="$ascii_color$(cat "$ascii")" -v reset="\033[0m" '
            BEGIN {
                print art reset "\n" 
            }
            { print $0 } 
            ' <<< "$data"
        ;;
        right)  
            mawk '                                                                                                                                                    
            BEGIN {
                art="'"$ascii_color"'"
                reset="\033[0m"
            }
            { print art $0 reset }
            ' "$ascii" | paste <(echo "$data") - | column -s $'\t' -t

        ;;
        bottom)
            echo "$data"
            echo -e "$ascii_color$(cat "$ascii")\033[0m"
            ;;
        *)
            mawk '                                                                                                                                                    
            BEGIN {
                art="'"$ascii_color"'"
                reset="\033[0m"
            }
            { print art $0 reset }
            ' "$ascii" | paste - <(echo "$data") | column -s $'\t' -t
        ;;


    esac

}

display_with_image() {
    local ascii=$1
    local data=$2
    viu "$ascii" | paste - <(echo "$data") | column -t
}

display() {
    local header_color="$1"
    local header="$2"

    local a_r=$((16#${header_color:1:2}))
    local a_g=$((16#${header_color:3:2}))
    local a_b=$((16#${header_color:5:2}))

    echo -e "\e[38;2;${a_r};${a_g};${a_b}m${header}\e[0m"

}

# gen_spaces() {
#     local num=$1
#     printf "%${num}s"
# }

