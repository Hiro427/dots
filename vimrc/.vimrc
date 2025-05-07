set nocompatible  " be iMproved, required

" Enable filetype detection and plugins
filetype on                  " required

call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
Plug 'catppuccin/vim' 
Plug 'mhinz/vim-tree'
Plug 'ryanoasis/vim-devicons'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion' "Optional
Plug 'itchyny/lightline.vim'
Plug 'lilydjwg/colorizer'
Plug 'liuchengxu/vim-clap'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'preservim/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-vinegar'
call plug#end() 
 

syntax enable 

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set hlsearch
set signcolumn=no 
set splitbelow
set number
set relativenumber
set termguicolors 
set encoding=UTF-8
set t_RV=
set ttymouse=xterm2
set laststatus=2
set noshowmode
set re=0

colorscheme catppuccin_mocha

let g:rainbow_active = 1 
let &t_SI = "\e[6 q"  "Blinking beam cursor in insert mode
let &t_SR = "\e[4 q" " Underline cursor in replace mode
let &t_EI = "\e[2 q" "Block cursor in normal mode
let mapleader = "\<Space>"
let &t_ut=''
let g:lightline = {
            \ 'colorscheme': 'catppuccin_mocha',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"vim-go syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1      " Highlights extra Go types
let g:go_highlight_generate_tags = 1    " Highlights struct tags for generated code
let g:go_highlight_variable_declarations = 1  " Highlights variable declarations
let g:go_highlight_variable_assignments = 1    " Highlights variable assignments
let g:go_highlight_function_calls = 1   " Highlights function calls distinctly
let g:tmux_navigator_no_mappings = 1

"Functions
function! MoveRightOrInsertTab()
    let l:char = getline('.')[col('.')-1]
    if l:char == ')' || l:char == '}' || l:char == ']' || l:char == '"' || l:char == "'" || l:char == ">" || l:char == "`"
        return "\<Right>"
    else
        return "\<Tab>"
    endif
endfunction

command! -nargs=* FindFile call fzf#run(fzf#wrap({
      \ 'source': 'find ~/coding ~/.dotfiles -type d \( -name .git -o -name .venv -o -name __pycache__ -o -name build -o -name dist -o -name .whl \) -prune -o -type f -print',
      \ 'sink': 'e',
      \ }))


nnoremap <leader>r :execute "!run " . expand('%')<CR>
"Keymaps 

nnoremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>

inoremap <expr> <C-J>     pumvisible() ? "\<C-n>" : "\<C-J>"
inoremap <expr> <C-K>   pumvisible() ? "\<C-p>" : "\<C-K>"

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>l :Lines<CR>
nnoremap <silent> <leader>g :Rg<CR>
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
inoremap <expr> <Tab> MoveRightOrInsertTab()
nnoremap <silent> <Leader>w <C-w>w
nnoremap <silent> <C-w>w <Nop>
nnoremap <silent> <leader>q :stop<CR>
nnoremap <silent> <leader>s :source ~/.vimrc<CR>
nnoremap <silent> <leader><leader> :FindFile<CR>
