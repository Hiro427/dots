alias ls="eza --color=always --git --icons=auto --no-user"
alias l="eza --color=always --git --icons=auto --no-user --no-permissions --no-time --long --no-filesize"
alias tree='eza --tree --color=always --icons=always --ignore-glob="node_modules|__pycache__|build|dist"'
alias c='cd ..'
alias e="exit"
alias t="task"
alias activate="source .venv/bin/activate"
alias cs="crumbs"
alias s="cd - >> /dev/null"
alias vim="nvim"
# alias rofi="rofi -show drun -normal-window"
alias tock='tock --format "" -c -C 7'
alias db='nvim +"enew" +"DBUIToggle"'
alias tsv="tmux split-pane -v"
alias tsh="tmux split-pane -h"
alias cur_date='date +"%m-%d-%Y-%H-%M-%S"'
alias search="is-fast"
alias nvidia-offload='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia "$@"'

bindkey -e
eval "$(zoxide init zsh --cmd 'cd')"
# eval $(thefuck --alias)
bindkey '^I' autosuggest-accept
bindkey -s '^f' 'y\n'
# bindkey -s '^x' 'tsm\n'
bindkey -s '^g' 'hist\n'
bindkey -s '^Z' 'fg\n' 


