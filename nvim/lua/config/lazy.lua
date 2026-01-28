-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

-- nvim options
local indent = 4

vim.opt.visualbell = true
vim.opt.termguicolors = true
vim.opt.ttimeoutlen = 5
vim.opt.splitright = true
vim.opt.foldmethod = "manual"
vim.opt.virtualedit = "all"
vim.opt.mouse = "a"
vim.wo.wrap = true
vim.opt.expandtab = true
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent
vim.opt.list = false
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

-- Search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt_global.shortmess:remove("F")
vim.g.clipboard = 'osc52'

-- Keybinds Updates
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[ ]]

vim.diagnostic.config({ virtual_lines = true })
vim.o.winborder = 'rounded'
vim.cmd([[filetype plugin indent on]])
vim.cmd([[set noea "set equalalways]])
vim.cmd([[set backspace=indent,eol,start]])
vim.cmd("set rtp+=~/dotfiles/myhelp/")
vim.cmd [[nmap <leader>hr :%!xxd<CR> :set filetype=xxd<CR>]]
vim.cmd [[nmap <leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>]]

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
})
