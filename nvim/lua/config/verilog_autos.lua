vim.notify = require("notify")
local vlog_group = vim.api.nvim_create_augroup("verilog_key_bindings", {})

function vlog_bind(cmd, augroup)
    vim.api.nvim_create_autocmd("Filetype", {
        pattern = "systemverilog",
        command = cmd,
        group = augroup,
    })
end

vlog_bind("map <leader>a <Plug>VerilogEmacsAutoAdd :redraw! <CR>", vlog_group)
vlog_bind("map <leader><leader>a <Plug>VerilogEmacsAutoAdd", vlog_group)
vlog_bind("map <leader>d <Plug>VerilogEmacsAutoDelete :redraw! <CR>", vlog_group)
vlog_bind("map <leader><leader>d <Plug>VerilogEmacsAutoDelete", vlog_group)
vim.cmd([[source $HOME/dotfiles/vim/verilog_emacsauto.vim]])
