export GOPATH=$HOME/.go          # Set GOPATH for Fedora or other systems
export PATH=$PATH:$GOPATH/bin    # Add Go binaries to your PATH for Fedora

source <(fzf --zsh)

export BAT_THEME="Catppuccin Mocha"

export UPDATE_LOG=$HOME/.dotfiles/logs/fedora_log.txt

export EDITOR="nvim" #for yazi

# export BPATH="$HOME/.config/bfetch"
export BPATH="$HOME/coding/projects/bfetch"
PATH=$PATH:~/.local/bin
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export MANGA_DL_DIR="$HOME/Downloads/Manga/"

export NVIM_LISTEN_ADDRESS=/tmp/nvim.pipe


eval "$(starship init zsh)"

eval "$(zoxide init zsh)"


export REPO_FPATH="$HOME"/.dotfiles/github/repos.txt

export PROJ_DIR="$HOME"/coding/projects/


export GHW_SUPPRESS_WARNINGS=1

export MANGA_TUI_DATA_DIR="$HOME/Downloads/mangatui"

export PATH="$HOME"/.nimble/bin:$PATH

export LS_COLORS="\
*.java=38;5;160:\
*.c=38;5;33:\
*.cpp=38;5;33:\
*.rs=38;5;202:\
*.go=38;5;44:\
*.ts=38;5;33:\
*.lua=38;5;213:\
*csv=38;5;114"

