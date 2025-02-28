_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}


tmux_fzf() {
    local session
    session=$(sesh list --icons | fzf-tmux -p 55%,60% \
        --no-sort --ansi --border-label 'sesh' --prompt '⚡ ' \
        --header '^a All ^t tmux ^g configs ^z zoxide ^d tmux kill ^ ' \
        --bind 'ctrl-a:change-prompt(⚡)+reload($(sesh list --icons)) ' \
        --bind 'ctrl-t:change-prompt(📂)+reload($(sesh list -t --icons)) ' \
        --bind 'ctrl-g:change-prompt(🛠)+reload($(sesh list -c --icons)) ' \
        --bind 'ctrl-x:change-prompt(🌐)+reload($(sesh list -z --icons)) ' \
        --bind 'ctrl-f:change-prompt(🔎)+reload($(fd -H -d 2 -t d -E .)) ' \
        --bind 'ctrl-d:execute(tmux kill-session -t {2..})' \
    )
    [ -n "$session" ] && tmux attach-session -t "$session"
}


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
