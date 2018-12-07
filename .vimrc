 " Add changes to this file for vim customization "

""""""" Configuration for Vundle (Vim-Plugin Installer)
set nocompatible
filetype off " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf.vim'
call vundle#end()
""""""" End configuration for Vundle

filetype plugin indent on
syntax on " Turns on syntax highlighting
" Keybinds for vim
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"Search color selection

"hi Search ctermbg=White
"hi Search ctermfg=Red

" Change line numbers to red
highlight LineNr ctermfg=red
set modelines =0
set wrap
set backspace=indent,eol,start
set ttyfast
set matchpairs+=<:>
set number
set encoding=utf-8
set fileencoding=utf-8
set hlsearch
set incsearch
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set relativenumber
set formatoptions=cro

colorscheme peachpuff
set t_Co=256


" Disables comment continuation in vim environment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"NERDtree configuration
"autocmd vimenter * NERDTree
nmap <S-l> :NERDTreeToggle<CR>
"End NERDtree configuration

"Enabling vim for .muttrc
au BufRead /tmp/mutt-* set tw=72




" vim-latexsuite config. Weird highlighting issues" 
"autocmd FileType tex setlocal spell spelllang=en_us 

"Set the following lines in your ~/.vimrc or the systemwide /etc/vimrc:
"set grepprg = grep\ -nH\ $*
 
"Also, this installs to /usr/share/vim/vimfiles, which may not be in
"your runtime path (RTP). Be sure to add it too, e.g:
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

