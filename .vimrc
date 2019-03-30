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
set encoding=utf-8
set linebreak
set scrolloff=8
set noerrorbells
set title
set history=1000
set colorcolumn=150
set showmatch       "highlighting the other parenthesis
set incsearch       "search as you type in
set hlsearch        "highlight all the matches
set clipboard=unnamedplus

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
autocmd BufNewFile *.sh 0r $PMP/vim/skeleton.sh
autocmd BufNewFile *.bash 0r $PMP/vim/skeleton.sh
autocmd BufNewFile *.cpp 0r $PMP/vim/skeleton.cpp
autocmd BufNewFile *.cc 0r $PMP/vim/skeleton.cpp
autocmd BufNewFile *.hh 0r $PMP/vim/skeleton.hh
autocmd BufNewFile *.tex 0r $PMP/vim/skeleton.tex
autocmd BufWritePre * %s/\s\+$//e "deletes all whitespaces at the end of the line
autocmd BufWritePost *.tex :!pdflatex % && evince %:r.pdf &

"Colorscheme
colorscheme peachpuff
