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
" Change line numbers to red
"highlight LineNr ctermfg=red
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

"let g:seoul256_background = 233
"let g:seoul256_srgb = 1
"colorscheme seoul256

colorscheme elda
set t_Co=256


" Disables comment continuation in vim environment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"NERDtree configuration
"autocmd vimenter * NERDTree
nmap <S-l> :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=45
"End NERDtree configuration

"Enabling vim for .muttrc
au BufRead /tmp/mutt-* set tw=72

" Tagbar Keybind Updates
nmap <S-M> :TagbarToggle<CR>

"VHDL Ctags enabling
let g:tagbar_type_vhdl = {
    \ 'ctagstype': 'vhdl',
    \ 'kinds' : [
        \'d:prototypes',
        \'b:package bodies',
        \'e:entities',
        \'a:architectures',
        \'t:types',
        \'p:processes',
        \'f:functions',
        \'r:procedures',
        \'c:constants',
        \'T:subtypes',
        \'r:records',
        \'C:components',
        \'P:packages',
        \'l:locals'
    \]
\}

let g:tagbar_type_systemverilog = {
    \ 'ctagstype': 'systemverilog',
    \ 'kinds' : [
         \'A:assertions',
         \'C:classes',
         \'E:enumerators',
         \'I:interfaces',
         \'K:packages',
         \'M:modports',
         \'P:programs',
         \'Q:prototypes',
         \'R:properties',
         \'S:structs and unions',
         \'T:type declarations',
         \'V:covergroups',
         \'b:blocks',
         \'c:constants',
         \'e:events',
         \'f:functions',
         \'m:modules',
         \'n:net data types',
         \'p:ports',
         \'r:register data types',
         \'t:tasks',
     \],
     \ 'sro': '.',
     \ 'kind2scope' : {
        \ 'K' : 'package',
        \ 'C' : 'class',
        \ 'm' : 'module',
        \ 'P' : 'program',
        \ 'I' : 'interface',
        \ 'M' : 'modport',
        \ 'f' : 'function',
        \ 't' : 'task',
     \},
     \ 'scope2kind' : {
        \ 'package'   : 'K',
        \ 'class'     : 'C',
        \ 'module'    : 'm',
        \ 'program'   : 'P',
        \ 'interface' : 'I',
        \ 'modport'   : 'M',
        \ 'function'  : 'f',
        \ 'task'      : 't',
     \ },
     \}

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

