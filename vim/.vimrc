""------------------------------------------------------------------------------"
 
""                             Plug Configuration                               "
""------------------------------------------------------------------------------"
set nocompatible
set visualbell
set t_vb=
"filetype off " required

call plug#begin('~/.vim/plugged')

if version > 800
    Plug 'benmills/vimux'
    Plug 'cometsong/CommentFrame.vim'
    Plug 'ycm-core/YouCompleteMe'
    Plug 'lervag/vimtex'
    "Plug 'neoclide/coc.nvim', { 'for': ['scala', 'sbt']}
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'camspiers/lens.vim'
    Plug 'psliwka/vim-smoothie'
    Plug 'honza/vim-snippets'
    Plug 'SirVer/ultisnips'
    "Plug 'camspiers/animate.vim'
endif

Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/tarikgraba/vim-lefdef.git'
Plug 'junegunn/fzf.vim'
Plug 'noah/vim256-color'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/verilog_emacsauto.vim'
Plug 'raingo/vim-matlab'
Plug 'junegunn/vim-easy-align'
Plug 'christoomey/vim-tmux-navigator'
Plug 'amal-khailtash/vim-xdc-syntax'
"Plug 'thinca/vim-localrc'
Plug 'justinmk/vim-syntax-extra' "c highlighting
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/tcl.vim--smithfield'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'aserebryakov/vim-todo-lists'
Plug 'liuchengxu/vista.vim'
Plug 'kshenoy/vim-signature'
Plug 'dhruvasagar/vim-table-mode'
 
"Plug 'tagexplorer.vim'
"Plug 'daeyun/vim-matlab'
"Plug 'dense-analysis/ale'
call plug#end()

""""""""""""""""""""""""""""""""""""
" Allows ESC sequence to not pend
set ttimeoutlen=5
set updatetime=1000
let g:python_highlight_all = 1
let g:python_version_2 = 0
let b:python_version_2 = 0

set rtp+=~/dotfiles/myhelp/
colorscheme elda
syntax on
filetype plugin indent on
set splitright
set foldmethod=manual
set virtualedit=all
set mouse=a
set noea "set equalalways
set modelines =0
set wrap
set backspace=indent,eol,start
set ttyfast
set matchpairs+=<:>
set hlsearch
set incsearch
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number relativenumber
set formatoptions=crot
set t_Co=256
set clipboard=unnamed
set encoding=utf-8
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
highlight search ctermbg = green

"------------------------------------------------------------------------------"
"                                Keybind Changes                               "
"------------------------------------------------------------------------------"
let mapleader ="\<Space>" " Change spacebar to leader key
let maplocalleader ="\<Space>"
nnoremap <leader>ev :vsplit $MYVIMRC <CR>
nnoremap <leader>vr :source $MYVIMRC <CR>
nnoremap <leader>eb :vsplit $HOME/.bashrc <CR>
nnoremap <leader>bn :bn <CR>
nnoremap <leader>bp :bp <CR>
nnoremap <leader>q :qa! <CR>
nnoremap <leader>wh <C-w>h 
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v
nnoremap <leader>c :let @/ = "" <CR>
nnoremap <F5> :set norelativenumber! <CR> :set nonumber! <CR>

"------------------------------------------------------------------------------"
"                              Load Vim Functions                              "
"------------------------------------------------------------------------------"
if filereadable(expand("$HOME/dotfiles/vim/vim_functions.vim"))
    source $HOME/dotfiles/vim/vim_functions.vim
endif

if filereadable(expand("$HOME/dotfiles/vim/vim_binds.vim"))
    source $HOME/dotfiles/vim/vim_binds.vim
endif

"------------------------------------------------------------------------------"
"                        Add fzf to rtp for all systems                        "
"------------------------------------------------------------------------------"
set rtp+=~/.fzf/

"------------------------------------------------------------------------------"
"                              Tab Movement in vim                             "
"------------------------------------------------------------------------------"
nnoremap tn :tabnew <CR>
nnoremap tc :tabclose <CR>
nnoremap tN :tab sball <CR>
nnoremap ts :tab split <CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

"------------------------------------------------------------------------------"
"                             Window Control in vim                            "
"------------------------------------------------------------------------------"
nnoremap <silent> <leader>l :redraw! <CR>
nnoremap <silent> <leader>we :exe "vertical resize " . (winheight(0) * 17/4)<CR>
nnoremap <silent> <leader>wq :exe "vertical resize " . (winheight(0) * 12/16)<CR>
nnoremap <silent> <leader>ww <C-w>= <CR>
nnoremap <silent> <leader>w- :sp <CR>
nnoremap <silent> <leader>w/ :vsp <CR>

"------------------------------------------------------------------------------"
"                               Filetype Updates                               "
"------------------------------------------------------------------------------"
autocmd FileType git setlocal foldmethod=syntax
au BufRead,BufNewFile *.bash_aliases set filetype=sh
au BufRead,BufNewFile *.scs set filetype=spectre
au BufRead,BufNewFile *.il set filetype=skill tabstop=4
    \ softtabstop=4
    \ textwidth=80
    \ autoindent
au BufRead,BufNewFile *.ils set filetype=skill
au BufRead,BufNewFile *.cdsinit set filetype=skill
au BufRead,BufNewFile *.cdsenv set filetype=skill
au BufRead,BufNewFile cds.lib set filetype=skill
au BufRead,BufNewFile *.sdc,*.xel set filetype=tcl
au BufRead,BufNewFile *.v,*.vg,*.vm,*.sv,*.vams,*.f set filetype=verilog_systemverilog.verilog.systemverilog
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=80
au BufRead,BufNewFile *.xdc set filetype=xdc
au BufRead,BufNewFile *.txt set filetype=notes
au BufRead,BufNewFile *.tex setlocal textwidth=80 spell spelllang=en_us
au BufRead,BufNewFile *.py set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=80
    \ autoindent

"------------------------------------------------------------------------------"
"                                 Vim-Fugitive + vimbinds                      "
"------------------------------------------------------------------------------"
nnoremap <leader>g   :Git
nnoremap <leader>o   :only <CR>
nnoremap <leader>gp  :Git push 
nnoremap <leader>gf  :Git fetch -p <CR>
nnoremap <leader>gs  :Git <CR> :only <CR>
nnoremap <leader>gl  :Git log --decorate <CR> :only <CR>
nnoremap <leader>go  :Git log -p % <CR>
nnoremap <leader>gd  :BranchCalcOverride <CR> :Gvdiffsplit!<C-R>d
nnoremap <leader>gt  :BranchReturn <CR> :<C-R>b<CR> :ClearClose<CR> :Git -p diff-tree -r <C-R>a <C-R>c %
" Checkout git branch launched from BranchCalc()
nnoremap <leader>gc  :BranchReturn <CR> :<C-R>b<CR> :ClearClose<CR> :Git checkout <C-R>c
nnoremap <leader>gb  :BranchCalc <CR>
" Note that Vim-Fugitive uses //2 and //3 for 3-way diff puts/gets
nnoremap <leader>gdh  :diffget //2 <CR>
nnoremap <leader>gdl  :diffget //3 <CR>
nnoremap <leader>nc ]c


"------------------------------------------------------------------------------"
"                              tmux / vimux config                             "
"------------------------------------------------------------------------------"
nnoremap <leader>vp :VimuxPromptCommand<CR>
nnoremap <leader>vc :VimuxCloseRunner<CR>
nnoremap <leader>vo :VimuxOpenRunner<CR>
nnoremap <leader>vl :VimuxRunLastCommand<CR>
nnoremap <leader>vi :VimuxInspectRunner<CR>

"------------------------------------------------------------------------------"
"                             Vim Buffer Naviation                             "
"------------------------------------------------------------------------------"
nnoremap <silent> <leader>wh :TmuxNavigateLeft <CR>
nnoremap <silent> <leader>wj :TmuxNavigateDown <CR>
nnoremap <silent> <leader>wk :TmuxNavigateUp <CR>
nnoremap <silent> <leader>wl :TmuxNavigateRight <CR>

"------------------------------------------------------------------------------"
"                                  Binary R/W                                  "
"------------------------------------------------------------------------------"
nmap <leader>hr :%!xxd<CR> :set filetype=xxd<CR>
nmap <leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>

"------------------------------------------------------------------------------"
"                                  fzf Config                                  "
"------------------------------------------------------------------------------"
if executable('fzf')
    if version > 810 
        let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
    endif

    let g:fzf_preview_window = ['right:50%', 'F1']

    function! FzfSpellSink(word)
      exe 'normal! "_ciw'.a:word
    endfunction

    " vim spellcheck with fzf
    function! FzfSpell()
      let suggestions = spellsuggest(expand("<cword>"))
      return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'window': { 'width': 0.9, 'height': 0.6}})
    endfunction

    " fzf plugin mappings
    nnoremap <leader>z= :call FzfSpell()<CR>
    nmap <leader>ff :Files 
    nmap <leader>tt :Tags <CR>
    nmap <leader>mm :Marks <CR>
    nnoremap <leader>bt :BTags <CR>
    nmap <leader>bb :Buffers <CR>
    nnoremap <leader>ft :Filetypes <CR>
endif


"------------------------------------------------------------------------------"
"                               ale Configuration                              "
"------------------------------------------------------------------------------"
let g:ale_c_parse_makefile = 1
let g:ale_linters = {'c': ['gcc']}

"------------------------------------------------------------------------------"
"                              animate/lens Config                             "
"------------------------------------------------------------------------------"
let g:lens#disabled_filetypes = ['vundle', 'qf', 'vista', '']
let g:lens#height_resize_max = (winheight(0)*8/10)
let g:lens#height_resize_min = (winheight(0)*8/10)
let g:lens#width_resize_max = (winwidth(0)*8/10)
let g:lens#width_resize_min = (winwidth(0)*8/10)

""""""" superbar Configuration"""""""
let g:SuperTabDefaultCompletionType = 'context'


"""""""EasyAlign File Finder"""""
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap <leader>w; vip :EasyAlign /\ze\S\+\s*[,;=]/<CR> vip :Tabular /=<CR> vip :Tabular /;<CR>
nnoremap <leader>w' vip :EasyAlign /\ze\s\+\s*[,;=]/<CR> vip :Tabular /=<CR> vip :Tabular /;<CR>

"------------------------------------------------------------------------------"
"                              Latex Configuration                             "
"------------------------------------------------------------------------------"
if ($USER == "tim")
    let g:vimtex_view_general_viewer="zathura"
endif

let g:tex_flavor = "latex"
let g:vimtex_quickfix_mode = 2
set conceallevel=0
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"
let g:vimtex_quickfix_ignore_filters = [
            \'float specifier changed to',
            \'Underfull',
            \'Overfull'
            \]

"------------------------------------------------------------------------------"
"                                vtags Keybinds                                "
"------------------------------------------------------------------------------"
if filereadable(expand("$HOME/.vtags-3.01/vtags_vim_api.vim"))
    source ~/.vtags-3.01/vtags_vim_api.vim
elseif ($USER != "tim")
    echo "Vtags Not Installed: Re-Run Install"
endif

"------------------------------------------------------------------------------"
"                          Verilog Autos / Vtags Confiurations                 "
"------------------------------------------------------------------------------"
augroup verilogBindings
    autocmd! verilogBindings
    autocmd FileType verilog_systemverilog map <leader>a <Plug>VerilogEmacsAutoAdd :redraw! <CR>
    autocmd Filetype verilog_systemverilog map <leader><leader>a <Plug>VerilogEmacsAutoAdd
    autocmd Filetype verilog_systemverilog map <leader>d <Plug>VerilogEmacsAutoDelete :redraw! <CR>
    autocmd Filetype verilog_systemverilog map <leader><leader>d <Plug>VerilogEmacsAutoDelete
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>v       : py3 try_show_frame()                <CR> <C-w>h <CR> : set filetype=verilog_systemverilog <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>i       : py3 try_go_into_submodule()         <CR> : py try_show_frame() <CR> : py try_print_module_trace() <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>u       : py3 try_go_upper_module()           <CR> : py try_show_frame() <CR> : py try_print_module_trace() <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>mt      : py3 try_print_module_trace()        <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>ct      : py3 clear_trace()                   <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader><Left>  : py3 try_trace_signal_sources()      <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader><Right> : py3 try_trace_signal_destinations() <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  gi              : py3 try_go_into_submodule()           <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  gu              : py3 try_go_upper_module()             <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  mt              : py3 try_print_module_trace()          <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  ct              : py3 clear_trace()                     <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space><Down>   : py3 try_roll_back()                   <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space><Up>     : py3 try_go_forward()                  <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>c        : py3 try_add_check_point()             <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>b        : py3 try_add_base_module()             <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>         : py3 try_space_operation()             <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>s        : py3 try_save_env_snapshort()          <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>r        : py3 try_reload_env_snapshort()        <CR>
augroup end

"------------------------------------------------------------------------------"
"                             YCM/Gutentags Control                            "
"------------------------------------------------------------------------------"
let g:ycm_collect_identifiers_from_tags_files = 1
  let g:ycm_filetype_blacklist = {
        \ 'tagbar': 1,
        \ 'markdown': 1,
        \ 'netrw': 1,
        \ 'unite': 1,
        \ 'vimwiki': 1,
        \ 'pandoc': 1,
        \ 'infolog': 1,
        \ 'leaderf': 1,
        \ 'mail': 1
        \}

"set tags=./tags;,tags; "Use ctags -R --fields=+l
"set tags^=.git/tags;
"let g:gutentags_ctags_tagfile=".git/tags"

" Note you can check specific filetype options
" with ctags --list-kinds=python
let g:gutentags_ctags_extra_args = [
      \ '--fields=ailmnS',
      \ '--tag-relative=yes',
      \ '--python-kinds=-i',
      \ ]
let g:gutentags_ctags_exclude = [
            \ '*.sv', '*.v',
            \ '*Makefile',
            \ 'env',
            \ 'fpga', 'generators', 'toolchains',
            \ 'tools', 'vlsi', 'project',
            \ ]
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_add_default_project_roots = 0

" Need to figure out a better project dir specifier
let g:gutentags_project_root = ['.tmp_top']
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
nnoremap <leader>dt :GutentagsClearCache <CR>

"------------------------------------------------------------------------------"
"                               Vista Tag Display                              "
"------------------------------------------------------------------------------"
nnoremap tt :Vista!! <CR>
" Don't jump to the vista window when opening
let g:vista_stay_on_open = 0
let g:vista#renderer#enable_icon = 0
let g:vista_icon_indent= ['▸', '▾'] 
let g:vista_fold_toggle_icons= ['▸', '▾'] 

"------------------------------------------------------------------------------"
"                                   UltiSnips                                  "
"------------------------------------------------------------------------------"
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-m>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"



let g:ycm_language_server = [
  \   { 'name': 'scala',
  \     'filetypes': [ 'scala', 'sbt' ],
  \     'cmdline': [ 'metals-vim' ],
  \     'project_root_files': [ 'build.sbt' ]
  \   },
  \ ]

"------------------------------------------------------------------------------"
"                                vim-todo-lists                                "
"------------------------------------------------------------------------------"
nnoremap <leader>td :vsplit $HOME/.tasklist.todo.md <CR>
let g:VimTodoListsDatesEnabled = 1
let g:VimTodoListsMoveItems = 0

" Misc
let g:ycm_auto_hover=""
nnoremap <silent> <leader>pp :Hover<CR>

"Mark toggling 
nnoremap <silent> <F2> :SignatureToggle<CR>
highlight SignatureMarkText ctermfg=red


" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-m>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"

"------------------------------------------------------------------------------"
"                                vim-table-mode                                "
"------------------------------------------------------------------------------"
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='
