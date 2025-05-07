call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'npm ci'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'fatih/vim-go'


"Themes
Plug 'arcticicestudio/nord-vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
Plug 'ghifarit53/tokyonight-vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'catppuccin/vim' 
Plug 'tomasr/molokai'

call plug#end() 
 
" Coc settings 
let g:coc_global_extensions = [
\ 'coc-pyright', 
\ 'coc-snippets', 
\ 'coc-prettier', 
\ 'coc-go', 
\ 'coc-explorer', 
\ 'coc-clangd', 
\ 'coc-tailwindcss', 
\ 'coc-tsserver', 
\ 'coc-rust-analyzer', 
\ 'coc-git',  
\ 'coc-lua',
\ 'coc-json',
\ 'coc-sh'
\ ] 
 


