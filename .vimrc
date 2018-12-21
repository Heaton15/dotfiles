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
Plugin 'junegunn/seoul256.vim'
Plugin 'noah/vim256-color'
Plugin 'vhda/verilog_systemverilog.vim' " Highlighting for V/SV
Plugin 'godlygeek/tabular'              " Enables user to line up code accordingly
Plugin 'majutsushi/tagbar'
Plugin 'jimmysitu/vtags'
Plugin 'BufOnly.vim' " Use :BufOnly command to kill all buffers but active one
Plugin 'wesQ3/vim-windowswap' " Switch vim buffers with <leader>ww
Plugin 'ervandew/supertab'
call vundle#end()
""""""" End configuration for Vundle

"""""""""""""""""""""""""""""""""""""
" Keybind Changes
let mapleader ="\<Space>" " Change spacebar to leader key
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l
"""""""""""""""""""""""""""""""""""""


filetype plugin indent on
syntax on " Turns on syntax highlighting
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
colorscheme elda
set t_Co=256
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
highlight search ctermbg = red
"let g:seoul256_background = 233
"let g:seoul256_srgb = 1
"colorscheme seoul256

"""""""Vim-windowswap Config"""""""""
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>m :call WindowSwap#EasyWindowSwap()<CR>
"""""""""""""""""""""""""""""""""""""

""""""" Vtags Configuration""""""""""
" vtags config
source ~/.vim/bundle/vtags/plugin/vtags_vim_api.vim
"nmap <S-a> 30<C-W>< <CR>
"nmap <S-a> 30<C-W>< <CR>
"""""""""""""""""""""""""""""""""""""

""""""" superbar Configuration"""""""
let g:SuperTabDefaultCompletionType = 'context'
"""""""""""""""""""""""""""""""""""""

"""""""NERDTree Config"""""""""""""""
"NERDtree configuration
"autocmd vimenter * NERDTree
nmap <S-l> :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=40
"End NERDtree configuration
"""""""""""""""""""""""""""""""""""""

""""""""Neomutt Config"""""""""""""""
"Enabling vim for .muttrc
au BufRead /tmp/mutt-* set tw=72
"""""""""""""""""""""""""""""""""""""


"""""""Tagbar Keybinds"""""""""""""""
nmap <S-M> :TagbarToggle<CR>
let g:tagbar_iconchars = ['▸', '▾']
set foldmethod=syntax
"""""""""""""""""""""""""""""""""""""

"""""""Verilog/Systemverilog Vim"""""
nnoremap <leader>i :VerilogFollowInstance<CR>
nnoremap <leader>I :VerilogReturnInstance<CR>
nnoremap <leader>u :VerilogFollowPort<CR>




" Sets up Ctags config
"let Tlist_Ctags_Cmd="/usr/bin/ctags"
"let Tlist_WinWidth=50
"map <F8> :!/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


" vim-latexsuite config. Weird highlighting issues" 
"autocmd FileType tex setlocal spell spelllang=en_us 
"let g:tex_flavor ="LaTex"

"Set the following lines in your ~/.vimrc or the systemwide /etc/vimrc:
"set grepprg = grep\ -nH\ $*
 
"Also, this installs to /usr/share/vim/vimfiles, which may not be in
"your runtime path (RTP). Be sure to add it too, e.g:
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

