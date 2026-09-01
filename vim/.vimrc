call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set smartindent
set showmode
set smartcase
set scrolloff=12
set signcolumn="yes"
set guioptions-=m
set guioptions-=T
set smoothscroll
set laststatus=2
set bg=dark
set colorcolumn=80
set termguicolors

let mapleader = " "

autocmd ColorScheme * highlight ColorColumn ctermbg=235 guibg=#282828

set noswapfile
set nocompatible
set nohlsearch
set nolist
set nowrap

autocmd Filetype sh setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

syntax on
let g:gruvbox_contrast_dark  = 'medium'
colorscheme gruvbox
set background=dark
hi Comment ctermfg=63
hi Search ctermbg=LightYellow

highlight RedundantWhitespace ctermbg=green guibg=green
match RedundantWhitespace /\s\+$\| \+\ze\t/

let g:fzf_vim = {}
let g:fzf_vim.preview_window = []

nnoremap <Leader><Space> :Files<CR>

let g:vim_markdown_folding_disabled = 1

let g:airline_powerline_fonts = 0
let g:airline_theme = "base16_gruvbox_dark_soft"
