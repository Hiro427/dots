show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# #nord
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#     --color=fg:#e5e9f0,bg:#2c2f35,hl:#d8dee9
#     --color=fg+:#e5e9f0,bg+:#2e3440,hl+:#d8dee9
#     --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
#     --color=marker:#4f6378,spinner:#b48dac,header:#4f6378'
#
# TokyoNight color scheme for fzf
# export FZF_DEFAULT_OPTS="
#     --color=fg:#c0caf5,bg:#1a1b26,hl:#7aa2f7
#     --color=fg+:#a9b1d6,bg+:#1f2335,hl+:#7aa2f7
#     --color=info:#0db9d7,prompt:#bb9af7,pointer:#f7768e
#     --color=marker:#e0af68,spinner:#7aa2f7,header:#565f89"
#
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
