-- Bootstrap lazy.nvim for plugin management
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Keybinds Updates
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[ ]]

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
})

-- keybinds
vim.keymap.set("n", "<leader>h", require("telescope.builtin").help_tags)

if vim.fn.has("nvim") == 1 then
    local initlua = vim.fn.expand("$HOME/.config/nvim")
    vim.keymap.set("n", "<leader>ev", ":Telescope find_files follow=true cwd=" .. initlua .. " <CR>")
else
    vim.keymap.set("n", "<leader>ev", ":vsplit $MYVIMRC <CR>")
end

vim.keymap.set("n", "<leader>eb", ":edit $HOME/.bashrc <CR>")
vim.keymap.set("n", "<leader>q", ":qa! <CR>")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>ws", "<C-w>s")
vim.keymap.set("n", "<leader>w/", "<C-w>v")

-- Tab movement in nvim
vim.keymap.set("n", "tn", ":tabnew <CR>")
vim.keymap.set("n", "tc", ":tabclose <CR>")
vim.keymap.set("n", "tN", ":tab sball <CR>")
vim.keymap.set("n", "ts", ":tab split <CR>")

-- digraph remapping
vim.keymap.set("i", "<C-y>", "<C-k>")

-- Move between tabs with leader + num
for i = 1, 9 do
    local key = "<leader>" .. i
    vim.keymap.set("n", key, i .. "gt")
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
vim.opt.modelines = 0

-- Search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true

local indent = 4

vim.opt.expandtab = true
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent
vim.opt.list = true
vim.opt.listchars = {
    -- Place a '#' in the last column when 'wrap' is off and the line continues beyond the right of the screen
    extends = "#",
    -- Place a '#' in the first column when 'wrap' is off and there is text preceding the character visible in the
    -- first column
    precedes = "#",
    -- Show non-breaking space characters
    nbsp = "¬",
    -- Show tabs
    tab = ".→",
    -- Show trailing spaces
    trail = "◊",
}

vim.wo.number = true
vim.wo.relativenumber = true
vim.bo.formatoptions = "crot"

vim.keymap.set("n", "<F5>", [[ :set norelativenumber! <CR> :set nonumber! <CR>]])

-- Window control in neovim
vim.keymap.set("n", "<leader>l", ":redraw <CR>", { silent = true })
vim.keymap.set("n", "<leader>ww", "<C-w>= <CR>", { silent = true })

local function set_ft(events, ft_list, ft, ft_cmd)
    if ft == nil then
        ft = ""
    else
        ft = [[set filetype=]] .. ft
    end

    if ft_cmd == nil then
        ft_cmd = ""
    end

    local cmd = ft .. " " .. ft_cmd

    for _, item in pairs(ft_list) do
        vim.api.nvim_create_autocmd(events, {
            pattern = { item },
            command = cmd,
        })
    end
end

-- autocmd assignments
local buf = { "BufRead", "BufNewFile" }
local ft_skill = { "*.ils", "*.cdsinit", "*.cdsenv", "cds.lib" }
local ft_tcl = { "*.sdc", "*.xel" }
local ft_vlog = { "*.v", "*.vg", "*.vm", "*.vh", "*.sv", "*.vams", "*.f" }
local ft_sh = { "*.sh", "*.bash_aliases", "*.bashrc", "*.bash" }
local ft_scala = { "*.mill", "*.scala" }

-- Set certain commonly used files to a filetype
set_ft(buf, ft_sh, "sh", [[tabstop=2 softtabstop=2 shiftwidth=2 textwidth=80 autoindent]])
set_ft(buf, ft_scala, "scala", [[tabstop=2 softtabstop=2 shiftwidth=2 textwidth=80 autoindent]])
set_ft(buf, { "*.scs" }, "spectre")
set_ft(buf, { "*.il" }, "skill", [[tabstop=4 softtabstop=4 textwidth=80 autoindent]])
set_ft(buf, ft_skill, "skill")
set_ft(buf, ft_tcl, "tcl")
set_ft(buf, ft_vlog, "verilog_systemverilog", [[tabstop=2 softtabstop=2 shiftwidth=2 textwidth=120]])
set_ft(buf, { "*.xdc" }, "xdc")
set_ft(buf, { "*.tex" }, nil, [[setlocal textwidth=80 spell spelllang=en_us]])
set_ft(buf, { "*.py" }, nil, [[set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 autoindent]])

-- Allows vim-fugitive to fold changes when viewing
set_ft({ "FileType" }, { "git" }, nil, [[setlocal foldmethod=syntax]])

-- tmux / vimux config
vim.keymap.set("n", "<leader>vp", ":VimuxPromptCommand<CR>")
vim.keymap.set("n", "<leader>vc", ":VimuxCloseRunner<CR>")
vim.keymap.set("n", "<leader>vo", ":VimuxOpenRunner<CR>")
vim.keymap.set("n", "<leader>vl", ":VimuxRunLastCommand<CR>")
vim.keymap.set("n", "<leader>vi", ":VimuxInspectRunner<CR>")

-- vim buffer navigation
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set("n", "<leader>wh", ":TmuxNavigateLeft <CR>", { silent = true })
vim.keymap.set("n", "<leader>wj", ":TmuxNavigateDown <CR>", { silent = true })
vim.keymap.set("n", "<leader>wk", ":TmuxNavigateUp <CR>", { silent = true })
vim.keymap.set("n", "<leader>wl", ":TmuxNavigateRight <CR>", { silent = true })

vim.cmd("set rtp+=~/dotfiles/myhelp/")
vim.opt_global.shortmess:remove("F")

-- Load external vtags plugin and run
-- Issues getting vtags working. python3 execute problems
require("config.vtags")
