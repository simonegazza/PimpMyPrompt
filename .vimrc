"Setting varibales
let mapleader = " "
let PMP=$PMP

"General
syntax enable
filetype indent on
set number
set nocompatible
set nostartofline
set ruler
set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab
set autoindent
set encoding=utf8
set linebreak
set scrolloff=8
set noerrorbells
set novisualbell
set title
set history=1000
set colorcolumn=150
set showmatch
set incsearch
set hlsearch
set clipboard=unnamedplus
set ffs=unix,dos,mac
set termguicolors

"Autocompletion
set wildmenu
set wildmode=list:longest,full
set mouse=a

"Recomandations and checking for bash scripts
map <leader>s :!clear && shellcheck %<CR>

"Easy settings for wildmenu
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Autocommands
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile *.sh 0r $PMP/vim/skeleton.sh
autocmd BufNewFile *.bash 0r $PMP/vim/skeleton.sh
autocmd BufNewFile *.py 0r $PMP/vim/skeleton.py
autocmd BufNewFile *.cpp 0r $PMP/vim/skeleton.cpp
autocmd BufNewFile *.cc 0r $PMP/vim/skeleton.cpp
autocmd BufNewFile *.hh 0r $PMP/vim/skeleton.hh
autocmd BufNewFile *.tex 0r $PMP/vim/skeleton.tex
autocmd BufNewFile *.rs 0r $PMP/vim/skeleton.rs
autocmd BufWritePre * %s/\s\+$//e "Deletes all whitespaces at the end of the line
autocmd BufWritePost *.tex :!pdflatex % && evince %:r.pdf &

"Colorscheme
source $PMP/vim/VimPMPTheme.vim "Need to source it because I don't want to interfere whith other colors

"Settings for statusLine
set laststatus=2
set statusline=
set statusline+=%1*\"%<%F\"\                          "File path, modified amd readonly
set statusline+=%3*│                                "|
set statusline+=%2*\ %Y\                            "File type
set statusline+=%3*│                                "|
set statusline+=%=                                  "Got to the right side
set statusline+=%2*\ col:\ %02v\                    "Col number
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\ %m%r    "Line number / total, percentage
