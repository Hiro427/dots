filetype plugin indent on 
" Enable syntax highlighting
syntax enable 

let mapleader = "\<Space>"

" Set number of colors
" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" Backspace behavior
set backspace=indent,eol,start
set hlsearch
" Sign column settings
set signcolumn=no 

set splitbelow
" " Display line numbers
set number
set relativenumber
set termguicolors 
" set showtabline=1
colorscheme catppuccin_mocha
set background=dark
" Change cursor shape based on mode
"
" In .vimrc to set cursor shape based on mode
let &t_SI = "\e[6 q"  "Blinking beam cursor in insert mode
let &t_SR = "\e[4 q" " Underline cursor in replace mode
let &t_EI = "\e[2 q" "Block cursor in normal mode

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



" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'default'
