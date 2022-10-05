-- Neovim Configurations
-- vim.g   : let
-- vim.opt : global options
-- vim.wo  : window options
-- vim.bo  : buffer options

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
      vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
      vim.api.nvim_command("packadd packer.nvim")
end


-- Compile packer config whenever 'plugins.lua' changes
--vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

require("plugins")

-- Keybinds Updates
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[ ]]

if vim.fn.has('nvim') == 1 then
    local initlua = vim.fn.expand("$HOME/.config/nvim")
    vim.keymap.set("n", "<leader>ev", ":Telescope find_files follow=true cwd=" .. initlua .. " <CR>")
else
    vim.keymap.set("n", "<leader>ev", ":vsplit $MYVIMRC <CR>")
end

--vim.keymap.set("n","<leader>ev", ":Telescope $MYVIMRC <CR>")
vim.keymap.set("n", "<leader>vr", ":source $MYVIMRC <CR>")
vim.keymap.set("n", "<leader>eb", ":vsplit $HOME/.bashrc <CR>")
vim.keymap.set("n", "<leader>bn", ":bn <CR>")
vim.keymap.set("n", "<leader>bp", ":bp <CR>")
vim.keymap.set("n", "<leader>q",  ":qa! <CR>")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>ws", "<C-w>s")
vim.keymap.set("n", "<leader>w/", "<C-w>v")
vim.keymap.set("n", "<leader>wv", "<C-w>v")

-- Tab movement in nvim
vim.keymap.set("n", "tn", ":tabnew <CR>")
vim.keymap.set("n", "tc", ":tabclose <CR>")
vim.keymap.set("n", "tN", ":tab sball <CR>")
vim.keymap.set("n", "ts", ":tab split <CR>")

-- Move between tabs with leader + num
for i=1,9 do
    key = '<leader>' .. i
    vim.keymap.set("n", key, i..'gt')
end

-- Global Settings
vim.g.python_highlight_all = 1
vim.g.python_version_2 = 0

-- nvim Configuration
vim.opt.visualbell = true

vim.opt.termguicolors = true
vim.opt.ttimeoutlen = 5

vim.cmd([[filetype plugin indent on]])
vim.cmd([[set noea "set equalalways]])
vim.cmd([[set backspace=indent,eol,start]])

vim.opt.splitright = true
vim.opt.foldmethod = "manual"
vim.opt.virtualedit = "all"
vim.opt.mouse = "a"
vim.wo.wrap = true
vim.opt.ttyfast = true
vim.opt.modelines = 0

-- Search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true

local indent = 4

vim.opt.expandtab = true
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent

vim.wo.number = true
vim.wo.relativenumber = true
vim.bo.formatoptions = "crot"

--vim.cmd([[highlight search guibg = green]])
vim.keymap.set("n", "<F5>", [[ :set norelativenumber! <CR> :set nonumber! <CR>]])

-- Window control in neovim
vim.keymap.set("n", "<leader>l",  ":redraw <CR>", {silent = true})
vim.keymap.set("n", "<leader>ww", "<C-w>= <CR>", {silent = true})
vim.keymap.set("n", "<leader>w-", ":sp <CR>", {silent = true})
vim.keymap.set("n", "<leader>w/", ":vsp <CR>", {silent = true})
vim.cmd[[nnoremap <leader>w; vip :EasyAlign /\ze\S\+\s*[,;=]/<CR> vip :Tabular /=<CR> vip :Tabular /;<CR>]]
vim.cmd[[nnoremap <leader>w' vip :EasyAlign /\ze\s\+\s*[,;=]/<CR> vip :Tabular /=<CR> vip :Tabular /;<CR>]]

function set_ft(events, ft_list, ft, ft_cmd)
    
    if (ft == nil) then
        ft = ''
    else 
        ft = [[set filetype=]] .. ft
    end

    if (ft_cmd == nil) then
        ft_cmd = ''
    end

    cmd = ft .. ' ' .. ft_cmd

    for _, item in pairs(ft_list) do
        vim.api.nvim_create_autocmd(events, { 
            pattern = {item},
            command = cmd,
        })
    end
end

-- autocmd assignments
local buf = {"BufRead", "BufNewFile"}
local ft_skill = {"*.ils", "*.cdsinit", "*.cdsenv", "cds.lib"}
local ft_tcl   = {"*.sdc", "*.xel"}
local ft_vlog  = {"*.v", "*.vg", "*.vm", "*.sv", "*.vams", "*.f"}

-- Set certain commonly used files to a filetype
set_ft(buf, {"*.bash_aliases"}, "sh")
set_ft(buf, {"*.scs"}, "spectre")

set_ft(buf, {"*.il"}, "skill", [[tabstop=4 softtabstop=4 textwidth=80 autoindent]])

set_ft(buf, ft_skill, "skill")
set_ft(buf, ft_tcl, "tcl")

-- TODO: determine if the verilog ft still needs updated based on the janky plugins that exist
set_ft(buf, ft_vlog, "verilog_systemverilog.verilog.systemverilog", [[softtabstop=4 shiftwidth=4 textwidth=80]])

set_ft(buf, {"*.xdc"}, "xdc")
set_ft(buf, {"*.txt"}, "notes")

-- TODO: If latex issues arise, check if textwidth needs to be setlocal again
set_ft(buf, {"*.tex"}, nil, [[setlocal textwidth=80 spell spelllang=en_us]])

set_ft(buf, {"*.py"}, nil, [[set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 autoindent]])
set_ft(buf, {"*.scala"}, nil, [[set tabstop=2 softtabstop=2 shiftwidth=2 textwidth=80 autoindent]])

-- Allows vim-fugitive to fold changes when viewing
set_ft({"FileType"}, {"git"}, nil, [[setlocal foldmethod=syntax]])

-- Vim-Fugitive Custom binds
vim.keymap.set("n", "<leader>o", ":only <CR>")
vim.keymap.set("n", "<leader>gp", ":Git push")
vim.keymap.set("n", "<leader>gf", ":Git fetch -p <CR>")
vim.keymap.set("n", "<leader>gs", ":Git <CR> :only <CR>")
vim.keymap.set("n", "<leader>gl", ":Git log --decorate <CR> :only <CR>")
vim.keymap.set("n", "<leader>go", ":Git log -p % <CR>")
vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit!<C-R>d")
vim.keymap.set("n", "<leader>gdh", ":diffget //2")
vim.keymap.set("n", "<leader>gdl", ":diffget //3")
vim.keymap.set("n", "<leader>nc", "]c")

-- tmux / vimux config
vim.keymap.set("n", "<leader>vp", ":VimuxPromptCommand<CR>")
vim.keymap.set("n", "<leader>vc", ":VimuxCloseRunner<CR>")
vim.keymap.set("n", "<leader>vo", ":VimuxOpenRunner<CR>")
vim.keymap.set("n", "<leader>vl", ":VimuxRunLastCommand<CR>")
vim.keymap.set("n", "<leader>vi", ":VimuxInspectRunner<CR>")

-- vim buffer navigation
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set("n", "<leader>wh", ":TmuxNavigateLeft <CR>", {silent = true})
vim.keymap.set("n", "<leader>wj", ":TmuxNavigateDown <CR>", {silent = true})
vim.keymap.set("n", "<leader>wk", ":TmuxNavigateUp <CR>", {silent = true})
vim.keymap.set("n", "<leader>wl", ":TmuxNavigateRight <CR>", {silent = true})

-- Binary R/W
vim.keymap.set("n", "<leader>hr", ":%!xxd<CR> :set filetype=xxd<CR>", {remap = true})
vim.keymap.set("n", "<leader>hw", ":%!xxd -r<CR> :set binary<CR> :set filetype=<CR>", {remap = true})

-- Ultisnips
--vim.g.UltiSnipsExpandTrigger="<c-b>"
--vim.g.UltiSnipsJumpForwardTrigger="<S-l>"
--vim.g.UltiSnipsJumpBackwardTrigger="<S-h>"

-- vim-table-mode
vim.g.table_mode_corner_corner=[[+]]
vim.g.table_mode_header_fillchar=[[=]]

vim.cmd([[colorscheme carbonfox]])
vim.cmd("set rtp+=~/dotfiles/myhelp/")

local async = require "plenary.async"


-- Load external vtags plugin and run
-- Issues getting vtags working. python3 execute problems
require("config.vtags")

cfg = {}

-- Have to add following packages because they are in opt/
vim.cmd([[packadd! lsp_signature.nvim]])
vim.cmd([[packadd! friendly-snippets]])
vim.cmd([[packadd! LuaSnip]])
require "lsp_signature".setup(cfg)
require("luasnip.loaders.from_vscode").lazy_load()
vim.opt_global.shortmess:remove("F")
vim.keymap.set("n", "<leader>mc", ":Telescope metals commands <CR>")


-- LuaSnip forward commands 
--vim.keymap.set("i", "<S-]>", "<cmd>lua require('luasnip').jump(1)<CR>", {silent = true})
--vim.keymap.set("s", "<S-]>", "<cmd>lua require('luasnip').jump(1)<CR>", {silent = true})
--vim.keymap.set("i", "<S-[>", "<cmd>lua require('luasnip').jump(-1)<CR>", {silent = true})
--vim.keymap.set("s", "<S-[>", "<cmd>lua require('luasnip').jump(-1)<CR>", {silent = true})


-- vista
vim.keymap.set("n", "tt", ":Vista!! <CR>")
vim.g.vista_stay_on_open = 0
vim.cmd[[let g:vista#renderer#enable_icon = 0]]

-- gutentags
--vim.g.gutentags_ctags_extra_args = {
--    '--fields=ailmnS',
--    '--tag-relative=yes',
--    '--python-kinds=-i',
--}
--
--vim.g.gutentags_ctags_exclude = {
--    '*.sv', '*.v',
--    '*Makefile',
--    'env',
--    'fpga', 'generators', 'toolchains',
--    'tools', 'vlsi', 'project',
--}
--vim.g.gutentags_generate_on_new = 1
--vim.g.gutentags_generate_on_missing = 1
--vim.g.gutentags_generate_on_write = 1
--vim.g.gutentags_generate_on_empty_buffer = 0
--vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/vim/ctags/')
--vim.g.gutentags_add_default_project_roots = 0
--vim.g.gutentags_project_root = '.tmp_top'
