#!/usr/bin/env bash


#Define Colors for Text 

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color 

UNDERLINE='\033[4m'

REPOS="$REPO_FPATH" #File path to .txt that stores the paths to git repos 

function new_note() {

    cd $HOME/coding/scratchpad 
    nvim $1

}
function pull_changes() {
    echo -e "${YELLOW}Checking Repositories...${NC}"

    for line in $(cat "$REPOS"); do
        cd "$line" || { echo -e "${RED}Failed to cd into $line${NC}"; continue; }
        
        # Check for unstaged changes
        if [[ -n "$(git status -s)" ]]; then
            echo -e "${RED}$(basename "$line")${NC} - Check Repo"
            continue
        fi

        # Run git pull if there are no unstaged changes
        if git pull | grep -q "Already up to date"; then
            echo -e "${GREEN}$(basename "$line")${NC} - No changes to pull"
        else
            echo -e "${GREEN}$(basename "$line")${NC} - Changes pulled successfully"
        fi
    done
}

function clone_repo {
    TARGET=$1
    # LINK="https://github.com/Hiro427/${TARGET}"
    gh repo clone "${TARGET}"
    
    # git clone "$LINK"

}

function check_diff {
    git diff
}

function read_url {
    url=$(grep 'url = ' .git/config | awk -F ' = ' '{print $2}')
    xdg-open "$url"

}

function lazy_git {


    for line in $(cat "$REPOS"); do
    cd "$line" || { echo "Failed to cd into $line"; continue; }
        if [[ -n "$(git status -s)" ]]; then
            cd "$line" || { echo -e "${RED}Failed to cd into $line"; continue; }
            lazygit
        fi
    done

    echo -e "All repos are clean"

}

function track_repo {

    line=$(pwd)
    echo "$line" >> "$REPOS"
    echo -e "${GREEN}added $(basename "$line")"

}

function pushConf {

    read -p "$1" response
    if [[ "$response" == "y" || "$response" == "Y" || -z "$conf" ]]; then 
       return 0 
    else 
        echo "Cancelled Push"
        break
    fi 
}

function repo_status {

    echo -e "${YELLOW}${UNDERLINE}Repos${NC}"

    for line in $(cat "$REPOS"); do
    cd "$line" || { echo "Failed to cd into $line"; continue; }
    if [[ -n "$(git status -s)" ]]; then 
        echo -e "${RED}$(basename $line)${NC}"
    else
        echo -e "${GREEN}$(basename $line)${NC}"
    fi
    done

}

function move_bin {

    target_file=$1
    BIN="/usr/local/bin"
    proj_dir=$(pwd)

    cd "$BIN" || { echo "Failed to change to $BIN"; return 1; }

    # Check if the target file already exists in BIN
    if [[ -f "$target_file" ]]; then
        sudo rm -i "$target_file" # Ask before removing the existing file
        echo -e "${RED}Removed $target_file${NC}"
    fi

    # Move back to the project directory to get the target file
    cd "$proj_dir" || { echo "Failed to change to $proj_dir"; return 1; }
    sudo mv "$target_file" "$BIN"
    echo -e "${GREEN}Moved $target_file to $BIN${NC}"
}


function exit_check {

    echo -e "${GREEN}Exiting...${NC}"
    for line in $(cat "$REPOS"); do
    cd "$line" || { echo "Failed to cd into $line"; continue; }
    if [[ -n "$(git status -s)" ]]; then
        echo -e "${RED}Aborting...${NC}"
        kill -2 $$

    else
        continue
    fi
    done

}

function sync_repo {

    git add .
    git commit -m "$*"
    pushConf "Push to main?: (y/n): "
    git push -u origin main
}

function new_git {

    git init 
    touch .gitignore 
}

function new_project {

    ROOT="$PROJ_DIR"

    read -p "Enter project type (go/rust/python): " response

    case $response in 
        go) 
            read -p "Enter Project Name: " name
            PROJ=$ROOT$name 
            mkdir $PROJ 
            cd $PROJ 
            go mod init $name 
            new_git
            ;;
        rust) 
            read -p "Enter Project Name: " name 
            cd $ROOT
            cargo new $name 
            ;;
        python)
            read -p "Enter Project Name: " name 
            PROJ=$ROOT$name
            mkdir $PROJ 
            cd $PROJ 
            new_git 
            python3 -m venv .venv
            echo ".venv/" >> .gitignore
            ;;
        *)
            read -p "Enter Project Name: " name 
            PROJ=$ROOT$name 
            mkdir $PROJ 
            cd $PROJ 
            new_git 
            ;;
    esac 

}

function new_repo {

    DIR=$(basename "$(pwd)")
    gh repo create "$DIR" --private --source=. --remote=origin 
    git branch -M main 

}


function search_web {

    URL="$1"
    xdg-open "$URL" 
}



function help_command {
            echo "-a - add, commit and push all files to main"
            echo "-c - clone a repo from your repository on github"
            echo "-i - initialize a repo on your github (current directory, private repo)"
            echo "-o - opens current directory on github.com"
            echo "-p - pulls changes for every repo in repos.txt"
            echo "-t - adds present directory to repos.txt"
            echo "-s - returns status of each repo in repos.txt (green/red)"
            echo "-l - opens lazygit for every repo in repos.txt that currently has any changes"
            echo "-n - new project | python, rust, go or other"
            echo "-x - closes terminal if no changes in tracked repos"
            echo "-d - git diff"
            echo "-b - perform websearch using search.brave.com/"
            echo -e "-m - moves file passed to /usr/local/bin"
            echo "      Checks if file of same name exists" 
            echo "      if duplicate is found, prompts for deletion"
            echo "      after deletion, moves file to destination"
            echo "      if duplicate doesn't exist, moves file to destination"

     

}

 
case "$1" in 
    -b) 
        search_web "https://search.brave.com/search?q=$OPTARG"
        ;;
    -a)
        sync_repo "$OPTARG"
        ;;
    -c)
        clone_repo "$OPTARG"
        ;;
    -i)
        new_repo 
        ;;
    -o)
        read_url 
        ;;
    -h) 
        help_command
       ;;
    -n) 
        new_project 
        ;;
    -s)
        repo_status 
        ;;
    -p) 
        pull_changes
        ;;
    -t) 
        track_repo 
        ;;
    -l) 
        lazy_git 
        ;;
    -d) 
        check_diff
        ;;
    -x) 
        exit_check 
        ;;
    -m) 
        move_bin "$OPTARG"
        ;;
    -v) 
        new_note "$OPTARG"
        ;;
    *) 
        echo -e "${RED}Not a Valid Option\n${NC}"
        help_command
        ;;
esac 



