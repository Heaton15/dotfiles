 " Add changes to this file for vim customization "

set nocompatible " St to vim only
syntax on " Turns on syntax highlighting
set modelines =0
set wrap
set backspace=indent,eol,start
set ttyfast
"set laststatus=2
set matchpairs+=<:>
set number
set encoding=utf-8
set hlsearch
set incsearch
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set relativenumber



" vim-latexsuite config. Weird highlighting issues" 
"autocmd FileType tex setlocal spell spelllang=en_us 

"Set the following lines in your ~/.vimrc or the systemwide /etc/vimrc:
"filetype indent on
"filetype plugin on
"set grepprg = grep\ -nH\ $*
"let g:tex_flavor = "latex"
 
"Also, this installs to /usr/share/vim/vimfiles, which may not be in
"your runtime path (RTP). Be sure to add it too, e.g:
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

