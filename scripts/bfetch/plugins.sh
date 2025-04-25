#!/bin/bash


CACHE="$HOME/.config/bfetch/tmp_cache.txt"

getNumPkg() {
   case "$(hostname)" in
    debian)
        dpkg-query -f '${binary:Package}\n' -W | wc -l
        ;;
    fedora)
        rpmlist=$(grep "num_rpm" "$CACHE")

        if [[ -n "$rpmlist" ]]; then 
            echo "$rpmlist" | cut -d':' -f2 
        else 
            find_num_rpm=$(rpm -qa | wc -l)
            echo "num_rpm:$find_num_rpm" >> "$CACHE"
            echo "$find_num_rpm"
        fi
        ;;
    *) 
        echo "unsupported distro"
        ;;
   esac
}

getTheme() {
    gsettings get org.gnome.desktop.interface gtk-theme | tr "'" " " | xargs
}

getPulseAudioLevel() {
    pactl  get-sink-volume @DEFAULT_SINK@ | awk '{print $5}'
}

getBrightness() {
    brightnessctl -m | cut -d, -f4
}
getRandQuote() {
    RESULT=$(sqlite3 "$HOME/.quotes.db" "select content, anime, character from quotes where length(content) <= 50 order by random() limit 1")
    if [[ -n "$RESULT" ]]; then 
        IFS='|' read -r QUOTE ANIME CHAR <<< "$RESULT"
        printf "%s\n" "$QUOTE"
        printf "\n%s - %s\n" "      $CHAR" "($ANIME)"
    else 
        echo "no quote found"
    fi

}

getLastUpdate() {
    if [ ! -f "$UPDATE_LOG" ]; then
        echo "No log file found. Run log_update first."
        return
    fi

    LAST_UPDATE=$(cat "$UPDATE_LOG")
    CURRENT_DATE=$(date +%Y-%m-%d)
    
    # Calculate days difference
    DIFF=$(( ( $(date -d "$CURRENT_DATE" +%s) - $(date -d "$LAST_UPDATE" +%s) ) / 86400 ))

    echo "${DIFF}d"
}

gitCheck() {
    REPOS_FILE="$REPO_FPATH"
    DIRTY_REPOS=()

    for line in $(cat "$REPOS_FILE"); do
        cd "$line" || continue
        if [[ -n "$(git status -s)" ]]; then
            DIRTY_REPOS+=("$(basename "$line")")
        fi
    done

    if [[ ${#DIRTY_REPOS[@]} -gt 0 ]]; then
        echo "$(IFS=,; echo "${DIRTY_REPOS[*]}")"
    else
        echo "Clean"
    fi
}


getKernelVersion() {
    uname -r 
}

getUser() {
    hn=$(hostname)
    echo "$USER@$hn" 
}

getiGPU() {
    gpu=$(grep "integrated_gpu" "$CACHE")
    
    if [[ -n "$gpu" ]]; then
        echo "$gpu" | cut -d':' -f2
    else
        find_integrated=$(lspci | grep -E "VGA" | cut -d':' -f4- | cut -d'(' -f1 | xargs)
        echo "integrated_gpu:$find_integrated" >> "$CACHE"
        echo "$find_integrated"
    fi

}
getGPU() {
    gpu=$(grep "discrete_gpu" "$CACHE")
    
    if [[ -n "$gpu" ]]; then
        echo "$gpu" | cut -d':' -f2
    else
        find_discrete=$(lspci | grep -E "NVIDIA" | cut -d'[' -f2 | cut -d']' -f1)
        echo "discrete_gpu:$find_discrete" >> "$CACHE"
        echo "$find_discrete"
    fi
}

getCPU() {
    cat /proc/cpuinfo | grep "model name" | uniq | cut -d':' -f2- | xargs
}

getMemoryInfo() {
    free -h | grep "Mem:" | awk '{print $3 "/" $2}'
}

getUptime() {
    uptime -p | cut -d' ' -f2- | tr ',' ' '| sed -E '
    s/([0-9]+) months?/\1M/g;   # Convert months to M
    s/([0-9]+) weeks?/\1w/g;    # Convert weeks to w
    s/([0-9]+) days?/\1d/g;     # Convert days to d
    s/([0-9]+) hours?/\1h/g;    # Convert hours to h
    s/([0-9]+) minutes?/\1m/g' # Convert minutes to m
}

getCurrentDate() {
    date +'%m-%d-%Y'
}

getPCModel() {
    hostnamectl | grep "Hardware Model" | cut -d: -f2 | awk '{$1=$1; print}'
}


getOS() {
    hostnamectl | grep "Operating System" | cut -d: -f2 | awk '{$1=$1; print}'
}

getNowPlaying() {
    if ! command -v playerctl &>/dev/null; then
        echo "playerctl not installed"
        exit 1
    fi

    # Get metadata
    title=$(playerctl metadata xesam:title 2>/dev/null)
    artist=$(playerctl metadata xesam:artist 2>/dev/null)

    # Combine title and artist if both exist
    if [[ -n "$title" && -n "$artist" ]]; then
        now_playing="$title - $artist"
    elif [[ -n "$title" ]]; then
        now_playing="$title"
    else
        echo "..."
        return
    fi

    # Check length and truncate if necessary
    max_length=50
    if [[ ${#now_playing} -gt $max_length ]]; then
        echo "${now_playing:0:max_length}..."
    else
        echo "$now_playing"
    fi
}

getShellVersion() {
    curShell=$(which $SHELL) 

    if [[ "$curShell" == "/usr/bin/zsh" ]]; then 
        echo $(zsh --version | cut -d' ' -f1-2)
    else 
        echo $(bash --version | head -n1 | awk '{print $4}' | cut -d- -f1)
    fi
}

getFileCounts() {

    local FILE_DIR="$HOME/coding/"
    local TOTAL=$(find "$FILE_DIR" "$HOME/.dotfiles" -type f -name "*.go" -o -name "*.sh" -o -name "*.c" -o -name "*.ts" | wc -l)

    sky="#89dceb"
    blue="#89b4fa"
    text="#cdd6f4"

    num_go=$(find "$FILE_DIR" "$HOME/.dotfiles" -type f -name "*.go" | wc -l)
    num_clang=$(find "$FILE_DIR" "$HOME/.dotfiles"  -type f -name "*.c" | wc -l)
    num_sh=$(find "$FILE_DIR" "$HOME/.dotfiles" -type f -name "*.sh" | wc -l)
    num_ts=$(find "$FILE_DIR" "$HOME/.dotfiles" -type f -name "*.ts" | wc -l)

    p_go=(" $(( (num_go * 100) / TOTAL ))%")
    p_ts=(" $(( (num_ts * 100) / TOTAL ))%")
    p_sh=(" $(( (num_sh * 100) / TOTAL ))%")
    p_clang=(" $(( (num_clang * 100) / TOTAL ))%") 

    # p_go=(" $num_go")
    # p_ts=(" $num_ts")
    # p_sh=(" $num_sh")
    # p_clang=(" $num_clang") 
    #


    printf "%s %s %s %s\n" "$p_go" "$p_ts" "$p_sh" "$p_clang"

}





