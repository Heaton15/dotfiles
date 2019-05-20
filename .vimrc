 " Add changes to this file for vim customization "

""""""" Configuration for Vundle (Vim-Plugin Installer)
set nocompatible
"filetype off " required
filetype plugin indent on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf.vim'
Plugin 'noah/vim256-color'
Plugin 'vhda/verilog_systemverilog.vim' " Highlighting for V/SV
Plugin 'godlygeek/tabular'              " Enables user to line up code accordingly
Plugin 'majutsushi/tagbar'
Plugin 'BufOnly.vim' " Use :BufOnly command to kill all buffers but active one
Plugin 'wesQ3/vim-windowswap' " Switch vim buffers with <leader>m
Plugin 'ervandew/supertab'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tagexplorer.vim'
Plugin 'vim-scripts/verilog_emacsauto.vim'
Plugin 'raingo/vim-matlab'
Plugin 'vim-scripts/ZoomWin'
Plugin 'ctrlpvim/ctrlp.vim'
call vundle#end()
""""""" End configuration for Vundle
"""""""""""""""""""""""""""""""""""""
set foldmethod=manual
au BufWinLeave *.v mkview
au BufWinEnter *.v silent loadview



" Keybind Changes
let mapleader ="\<Space>" " Change spacebar to leader key
"nnoremap <C-h> <C-w>h 
"nnoremap <C-j> <C-w>j 
"nnoremap <C-k> <C-w>k 
"nnoremap <C-l> <C-w>l
nnoremap <leader>wh <C-w>h 
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v
" Easy way to move between vim tabs
nnoremap tn :tabnew <CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

nnoremap <silent> <leader>we :exe "vertical resize " . (winheight(0) * 16/4)<CR>
nnoremap <silent> <leader>wq :exe "vertical resize " . (winheight(0) * 12/16)<CR>


set mouse=n

" Only active if not using neovim
if !has('nvim')
 set ttymouse=urxvt
endif

set noea "set equalalways
"""""""""""""""""""""""""""""""""""""

filetype plugin indent on
"""" Filetype For Cadence Tools """"
au BufRead,BufNewFile *.scs set filetype=spectre
au BufRead,BufNewFile *.il set filetype=skill
au BufRead,BufNewFile *.ils set filetype=skill
au BufRead,BufNewFile *.cdsinit set filetype=skil


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

""""""" superbar Configuration"""""""
let g:SuperTabDefaultCompletionType = 'context'

"""""""NERDTree Config"""""""""""""""
nmap <S-l> :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=40

""""""""Neomutt Config"""""""""""""""
"Enabling vim for .muttrc
au BufRead /tmp/mutt-* set tw=72

"""""""Tagbar Keybinds"""""""""""""""
nmap <S-M> :TagbarToggle<CR>
let g:tagbar_iconchars = ['▸', '▾']


"""""""Verilog/Systemverilog Vim"""""
nnoremap <leader>i :VerilogFollowInstance<CR>
nnoremap <leader>I :VerilogReturnInstance<CR>
nnoremap <leader>u :VerilogFollowPort<CR>

"""""""CtrlP File Finder"""""
nmap <leader>ff :CtrlP <CR>
