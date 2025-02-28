# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User Environment
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# Load Rust environment (already sets .cargo/bin in PATH)
. "$HOME/.cargo/env"

# Set Go environment
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin"

# Add Nimble binaries if needed
export PATH="$HOME/.nimble/bin:$PATH"

# Ensure /usr/local/bin is in PATH
export PATH="/usr/local/bin:$PATH"



#CLI Utils Setup
eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"
eval "$(fzf --bash)"

#gruvbox 
# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
#   --color=fg:#ebdbb2,bg:#282828,hl:#b8bb26
#   --color=fg+:#fbf1c7,bg+:#3c3836,hl+:#fabd2f
#   --color=info:#8ec07c,prompt:#d79921,pointer:#fb4934
#   --color=marker:#fabd2f,spinner:#d79921,header:#fe8019"
#


#Catppuccin-Mocha 
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"


#Gum Settings
export GUM_FILTER_TEXT_FOREGROUND="#a6adc8"
export GUM_FILTER_MATCH_FOREGROUND="#eba0ac"
export GUM_FILTER_INDICATOR_FOREGROUND="#89b4fa"
export GUM_FILTER_PROMPT_FOREGROUND="#89dceb"
# export GUM_FILTER_HEADER_FOREGROUND="#fab387"
export GUM_FILTER_PLACEHOLDER_FOREGROUND="#6c7086"
export GUM_FILTER_CURSOR_TEXT_FOREGROUND="#94e2d5"


export GUM_CHOOSE_ITEM_FOREGROUND="#a6adc8"
# export GUM_CHOOSE_MATCH_FOREGROUND="#eba0ac"
# export GUM_CHOOSE_FOREGROUND="#89b4fa"
export GUM_CHOOSE_CURSOR_FOREGROUND="#89dceb"
# export GUM_FILTER_HEADER_FOREGROUND="#fab387"
# export GUM_CHOOSE_PLACEHOLDER_FOREGROUND="#b4befe"
# export GUM_CHOOSE_CURSOR_TEXT_FOREGROUND="#94e2d5"

export GUM_FILE_DIRECTORY_FOREGROUND="#a6adc8"
# export GUM_CHOOSE_MATCH_FOREGROUND="#eba0ac"
export GUM_FILE_FILE_FOREGROUND="#89b4fa"
export GUM_FILE_CURSOR_FOREGROUND="#89dceb"
export GUM_FILE_HEADER_FOREGROUND="#fab387"
# export GUM_E_PLACEHOLDER_FOREGROUND="#b4befe"
export GUM_FILE_SELECTED_FOREGROUND="#94e2d5"



#Environemnt Variables 
export UPDATE_LOG="$HOME/.dotfiles/logs/fedora_log.txt"
export MANGA_DL_DIR="$HOME/Downloads/Manga/"


#aliases
alias ls="eza --color=always --git --icons=auto --no-user"
alias l="eza --color=always --git -a --icons=auto --no-user --no-permissions --no-time --long --no-filesize"
alias tree='eza --tree --color=always --icons=always --ignore-glob="node_modules|__pycache__|build|dist"'
alias c='cd ..'
alias jn="jupyter notebook"
alias gss="git status -s"
alias gs="git status"
alias e="exit"
alias t="task"
alias sfetch="bfetch -art linux top"
alias activate="source .venv/bin/activate"
alias cs="crumbs"
alias s="cd - >> /dev/null"
alias x="crumbs -x && exit"
alias vim="nvim"
alias rofi="rofi -show drun -normal-window"
alias sf="simplefetch"
alias tock='tock --format "" -c -C 7'
alias db='nvim +"enew" +"DBUIToggle"'
alias zen="flatpak run io.github.zen_browser.zen"
alias tsv="tmux split-pane -v"
alias tsh="tmux split-pane -h"
alias cur_date='date +"%m-%d-%Y-%H-%M-%S"'


#Environment Variables

export BAT_THEME="Catppuccin Mocha"
export UPDATE_LOG=$HOME/.dotfiles/logs/fedora_log.txt
export EDITOR="nvim" #for yazi
export BPATH="$HOME/coding/projects/bfetch"
export MANGA_DL_DIR="$HOME/Downloads/Manga/"
export NVIM_LISTEN_ADDRESS=/tmp/nvim.pipe
export REPO_FPATH="$HOME"/.dotfiles/github/repos.txt
export PROJ_DIR="$HOME"/coding/projects/
export GHW_SUPPRESS_WARNINGS=1
export MANGA_TUI_DATA_DIR="$HOME/Downloads/mangatui"
#eza settings
export LS_COLORS="\
*.java=38;5;160:\
*.c=38;5;33:\
*.cpp=38;5;33:\
*.rs=38;5;202:\
*.go=38;5;44:\
*.ts=38;5;33:\
*.lua=38;5;213:\
*csv=38;5;114"

#Autostart
