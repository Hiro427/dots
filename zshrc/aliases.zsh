alias ls="eza --color=always --git --icons=auto --no-user"
alias l="eza --color=always --git --icons=auto --no-user --no-permissions --no-time --long --no-filesize"
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

# alias wezterm='flatpak run org.wezfurlong.wezterm'

eval "$(zoxide init zsh --cmd 'cd')"
# eval $(thefuck --alias)

bindkey '^I' autosuggest-accept
bindkey -s '^f' 'y\n'
bindkey -s '^x' 'tsm\n'
bindkey -s '^g' 'hist\n'
bindkey -s '^Z' 'fg\n' 

if [[ $(hostname) == "fedora" ]]; then
    alias ff="fastfetch --logo ~/.dotfiles/assets/icons/gojo-ascii.txt --logo-padding-left 4 --logo-padding-right 4 && aniquote random"
elif [[ $(hostname) == "debian" ]]; then
    alias ff="fastfetch && aniquote random"
else
    alias ff="fastfetch"
fi


