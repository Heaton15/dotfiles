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
Plugin 'tagexplorer.vim'
Plugin 'vim-scripts/verilog_emacsauto.vim'
Plugin 'raingo/vim-matlab'
Plugin 'vim-scripts/ZoomWin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'szw/vim-g'
"Plugin 'jimmysitu/vtags.git'
call vundle#end()
source ~/.vim/bundle/vtags-3.00/vtags_vim_api.vim
"source ~/Tim_Project_Temporary/packages/vtags-3.00/vtags_vim_api.vim
""""""" End configuration for Vundle
"""""""""""""""""""""""""""""""""""""
set foldmethod=manual

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

nnoremap <silent> <leader>we :exe "vertical resize " . (winheight(0) * 17/4)<CR>
nnoremap <silent> <leader>wq :exe "vertical resize " . (winheight(0) * 12/16)<CR>
nnoremap <silent> <leader>ww <C-w>= <CR>

set virtualedit=all
set mouse=n

" Only active if not using neovim
if !has('nvim')
 set ttymouse=xterm2
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
highlight search ctermbg = green

" Make something full screen "
nnoremap <leader>wm :ZoomWin<CR>

"""""""Tmux / Vimux Configuration"""""""""
map <leader>vp :VimuxPromptCommand<CR>
map <leader>vl :VimuxRunLastCommand<CR>
map <leader>vi :VimuxInspectRunner<CR>
map <leader>vz :VimuxZoomRunner<CR>

"""""""vim-navigation-keybinds"""""""""
nnoremap <silent> <leader>wh :TmuxNavigateLeft <CR>
nnoremap <silent> <leader>wj :TmuxNavigateDown <CR>
nnoremap <silent> <leader>wk :TmuxNavigateUp <CR>
nnoremap <silent> <leader>wl :TmuxNavigateRight <CR>


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

"""""""File Finder Commands"""""
nmap <leader>ff :FZF <CR>
nmap <leader>bb :Buffers <CR>
"""""""EasyAlign File Finder"""""
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap <leader>w; vip :EasyAlign /\ze\S\+\s*[,;=]/<CR> vip :Tab /=<CR> vip :Tab /;<CR>
nnoremap <leader>w' vip :EasyAlign /\ze\s\+\s*[,;=]/<CR> vip :Tab /=<CR> vip :Tab /;<CR>

"""""""Google"""""
nnoremap <leader>gg :Google 

" vtags keybinds "
nnoremap <leader>i  :py try_go_into_submodule()           <CR> :py try_show_frame() <CR>
nnoremap <leader>u  :py try_go_upper_module()             <CR> :py try_show_frame() <CR>
nnoremap <leader>mt :py try_print_module_trace()          <CR>
nnoremap <leader>ct :py clear_trace()                     <CR>
nnoremap <leader>v  :py try_show_frame()                  <CR>
nnoremap <leader>q  :py try_close_all_windows()           <CR>

                              
                              
                              
                              
