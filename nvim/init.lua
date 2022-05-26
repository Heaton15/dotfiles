-- Neovim Configurations

local cmd = vim.cmd -- shorthand for the vim.cmd('cd') calls
local fn = vim.fn -- shorthand for fn.bufnr() calls
local g = vim.g -- table for the global variables

-- vim.g   : let
-- vim.opt : global options
-- vim.wo  : window options
-- vim.bo  : buffer options

function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

-- Can now call 1 function to set the options
local scopes = { o = vim.opt, b = vim.b, w = vim.wo}
local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

-- Keybinds Updates
g.mapleader = " "
g.maplocalleader = " " 

nmap("<leader>ev", ":vsplit $MYVIMRC <CR>")
nmap("<leader>vr", ":source $MYVIMRC <CR>")
nmap("<leader>eb", ":vsplit $HOME/.bashrc <CR>")
nmap("<leader>bn", ":bn <CR>")
nmap("<leader>bp", ":bp <CR>")
nmap("<leader>q",  ":qa! <CR>")
nmap("<leader>wh", "<C-w>h")
nmap("<leader>wj", "<C-w>j")
nmap("<leader>wk", "<C-w>k")
nmap("<leader>wl", "<C-w>l")
nmap("<leader>ws", "<C-w>s")
nmap("<leader>w/", "<C-w>v")
nmap("<leader>wv", "<C-w>v")

-- Tab movement in nvim
nmap("tn", ":tabnew <CR>")
nmap("tc", ":tabclose <CR>")
nmap("tN", ":tab sball <CR>")
nmap("ts", ":tab split <CR>")
nmap("<leader>1", "1gt")
nmap("<leader>2", "2gt")
nmap("<leader>3", "3gt")
nmap("<leader>4", "4gt")
nmap("<leader>5", "5gt")
nmap("<leader>6", "6gt")
nmap("<leader>7", "7gt")
nmap("<leader>8", "8gt")
nmap("<leader>9", "9gt")

-- Global Settings
g.python_highlight_all = 1
g.python_version_2 = 0

-- nvim Configuration
vim.opt.visualbell = true

opt("o", "termguicolors", true)
opt("o", "ttimeoutlen", 5)
cmd([[syntax on]])
cmd([[filetype plugin indent on]])
cmd([[set noea "set equalalways]])
cmd([[set backspace=indent,eol,start]])
opt("o", "splitright", true)
opt("o", "foldmethod", "manual")
opt("o", "virtualedit", "all")
opt("o", "mouse", "a")
opt("w", "wrap", true)
opt("o", "ttyfast",  true)
opt("o", "modelines", 0)

-- Search settings
opt("o", "hlsearch", true)
opt("o", "incsearch", true)

local indent = 4
opt("b", "expandtab", true)
opt("b", "tabstop", indent)
opt("b", "softtabstop", indent)
opt("b", "shiftwidth", indent)

opt("w", "number", true)
opt("w", "relativenumber", true)
opt("b", "formatoptions", "crot")

--cmd([[highlight search guibg = green]])
--nmap("<F5>", ":set norelativenumber! <CR> :set nonumber! <CR>")

		--bold
		--underline
		--underlineline	double underline
		--undercurl	curly underline
		--underdot	dotted underline
		--underdash	dashed underline
		--strikethrough
		--reverse
		--inverse		same as reverse
		--italic
		--standout
		--nocombine	override attributes instead of combining them
		--NONE		no attributes used (used to reset it)

local tim = 5

require('nightfox').setup({
    options = {
        --Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        transparent = false,    -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false,   -- Non focused panes set to alternative background
        styles = {              -- Style to be applied to different syntax groups
            comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
        },
        inverse = {             -- Inverse highlight for different types
            match_paren = true,
            visual = false,
            search = false,
        },
        modules = {             -- List of various plugins and additional options
        -- ...
        },
    }
})


cmd([[colorscheme terafox]])
cmd("set rtp+=~/dotfiles/myhelp/")

-- Auto install packer.nvim if not exists
-- Bootstrap packer installation
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
      vim.api.nvim_command("packadd packer.nvim")
end

-- Compile packer config whenever 'plugins.lua' changes
cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

require("plugins")

require'nvim-treesitter.configs'.setup {
  -- Modules and its options go here
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}



   
   
   
   
   
   
