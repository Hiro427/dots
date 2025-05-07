function! ShowKeymapTable()
  echo "╔═════════════════╦════════════════════════════════════════╗"
  echo "║ Key Mapping     ║ Description                            ║"
  echo "╠═════════════════╬════════════════════════════════════════╣"
  echo "║ <leader>n       ║ Create New File                        ║"
  echo "║ <leader>q       ║ Quit Vim                               ║"
  echo "║ <leader>fs      ║ Fuzzy Files                            ║"
  echo "║ <leader>rf      ║ Search Recent Files                    ║"
  echo "║ <leader>w       ║ Switch Windows                         ║"
  echo "║ <leader>l       ║ Search Lines                           ║"
  echo "║ <leader>c       ║ Search Commands                        ║"
  echo "║ <leader>e       ║ Open Coc Explorer                      ║"
  echo "║ <leader>t       ║ Open Floaterm                          ║"
  echo "║ <leader>g       ║ RipGrep Search                         ║"
  echo "║ <leader>cs      ║ Change theme                           ║"
  echo "╚═════════════════╩════════════════════════════════════════╝"
endfunction

" Map a command to show the table
command! Keymaps call ShowKeymapTable()

"Function to move past closing characters
function! MoveRightOrInsertTab()
    let l:char = getline('.')[col('.')-1]
    if l:char == ')' || l:char == '}' || l:char == ']' || l:char == '"' || l:char == "'"
        return "\<Right>"
    else
        return "\<Tab>"
    endif
endfunction

" Fuzzy find a file across the entire system based on its name
" command! -nargs=* FindFile call fzf#run(fzf#wrap({'source': 'find ~/coding ~/.dotfiles -type d \( -name .git -o -name .venv -o -name __pycache__ \) -prune -o -type f -print', 'sink': 'e'}))

command! -nargs=* FindFile call fzf#run(fzf#wrap({
      \ 'source': 'find ~/coding ~/.dotfiles -type d \( -name .git -o -name .venv -o -name __pycache__ \) -prune -o -type f -print',
      \ 'sink': 'e',
      \ 'options': '--preview "bat --style=numbers --color=always --line-range :500 {}"'
      \ }))

" autocmd VimEnter * call SetDark()
" function! SetDark()
"     execute "set background=dark 
"     endfunction



