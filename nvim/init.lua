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

require("plugins")

-- Compile packer config whenever 'plugins.lua' changes
local packer_user_config = vim.api.nvim_create_augroup("packer_user_config", {})
vim.api.nvim_create_autocmd(
    "BufWritePost",
    { pattern = "plugins.lua", command = "source <afile> | PackerCompile", group = packer_user_config }
)

-- Keybinds Updates
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[ ]]

-- Can now call 1 function to set the options
local scopes = { o = vim.opt, b = vim.b, w = vim.wo}
local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

vim.keymap.set("n","<leader>ev", ":vsplit $MYVIMRC <CR>")
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
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")

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
set_ft(buf, ft_vlog, "systemverilog", [[softtabstop=4 shiftwidth=4 textwidth=80]])
set_ft(buf, {"*.xdc"}, "xdc")
set_ft(buf, {"*.txt"}, "notes")

-- TODO: If latex issues arise, check if textwidth needs to be setlocal again
set_ft(buf, {"*.tex"}, nil, [[setlocal textwidth=80 spell spelllang=en_us]])

set_ft(buf, {"*.py"}, nil, [[set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 autoindent]])

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
vim.keymap.set("n", "<leader>wh", ":TmuxNavigateLeft <CR>", {silent = true})
vim.keymap.set("n", "<leader>wj", ":TmuxNavigateDown <CR>", {silent = true})
vim.keymap.set("n", "<leader>wk", ":TmuxNavigateUp <CR>", {silent = true})
vim.keymap.set("n", "<leader>wl", ":TmuxNavigateRight <CR>", {silent = true})

-- Binary R/W
vim.keymap.set("n", "<leader>hr", ":%!xxd<CR> :set filetype=xxd<CR>", {remap = true})
vim.keymap.set("n", "<leader>hw", ":%!xxd -r<CR> :set binary<CR> :set filetype=<CR>", {remap = true})

-- Ultisnips
vim.g.UltiSnipsExpandTrigger="<c-b>"
vim.g.UltiSnipsJumpForwardTrigger="<c-m>"
vim.g.UltiSnipsJumpBackwardTrigger="<c-n>"

-- vim-table-mode
vim.g.table_mode_corner_corner=[[+]]
vim.g.table_mode_header_fillchar=[[=]]


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


vim.cmd([[colorscheme terafox]])
vim.cmd("set rtp+=~/dotfiles/myhelp/")


-- Compile packer config whenever 'plugins.lua' changes
vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])


require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "c",
        "comment",
        "cpp",
        "html",
        "json",
        "latex",
        "lua",
        "python",
        "regex",
        "rst",
        "scala",
        "verilog",
        "yaml",
        --"devicetree",
    },
    highlight = { enable = true },
    textobjects = { enable = true },
    incremental_selection = { enable = true },
})
