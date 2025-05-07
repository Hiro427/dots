" Map <leader>f to :Files
nnoremap <silent> <leader>ff :Files<CR>
" Map <leader>l to :Lines
nnoremap <silent> <leader>ll :BLines<CR>
nnoremap <silent> <leader>g :Rg<CR>
"coc_explorer
nnoremap <silent> <leader>e :CocCommand explorer<CR>

inoremap <expr> <Tab> MoveRightOrInsertTab()

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Automatically save when exiting insert mode
autocmd InsertLeave * :w
" Remap jj and jk to exit Insert mode
inoremap jj <Esc>
inoremap jk <Esc>
" Unmap the default window switch command
nnoremap <silent> <Leader>w <C-w>w
" Optionally, you can disable the original mapping if you don't want to use it
nnoremap <silent> <C-w>w <Nop>

nnoremap <silent> <leader>k :Keymaps<CR>

nnoremap <silent> <leader>ss :Buffers<CR> 

nnoremap <silent> <leader>d :call CocActionAsync('doHover')<CR>

nnoremap <silent> <leader>q :stop<CR>

nnoremap <silent> <leader><Tab> :tabnext<CR>

nnoremap <silent> <silent><Tab>n :tabnew<CR>

nnoremap <silent> <Tab>w :tabclose<CR>

nnoremap <silent> <leader>sv :source ~/.vimrc<CR>

nnoremap <silent> <leader><leader> :FindFile<CR>

nnoremap<silent> <leader>cs :Colors<CR>
