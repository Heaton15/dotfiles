vim.notify = require("notify")
local vtags_version = "https://www.vim.org/scripts/download_script.php?src_id=28365" -- 3.11
local version = "3.11"
local dest = ".vtags-" .. version

-- Curl down vtags and install it in the home directory

local vtags_path = "$HOME/" .. dest .. "/vtags_vim_api.vim"
if vim.fn.filereadable(vim.fn.expand(vtags_path)) == 0 then
    vim.notify("No Vtags Detected. ---Installing---", "INFO")
    os.execute("curl -o ~/.vtags.tar.gz " .. vtags_version)
    os.execute("mkdir ~/" .. dest .. " && tar -xvzf ~/.vtags.tar.gz -C ~/" .. dest)
end

-- Create vtags keybinds. This is pretty clanky compared to other plugins
local vlog_group = vim.api.nvim_create_augroup("verilog_key_bindings", {})

function vlog_bind(cmd, augroup)
    vim.api.nvim_create_autocmd("Filetype", {
        pattern = "verilog",
        command = cmd,
        group = augroup,
    })
end

vlog_bind("map <leader>a <Plug>VerilogEmacsAutoAdd :redraw! <CR>", vlog_group)
vlog_bind("map <leader><leader>a <Plug>VerilogEmacsAutoAdd", vlog_group)
vlog_bind("map <leader>d <Plug>VerilogEmacsAutoDelete :redraw! <CR>", vlog_group)
vlog_bind("map <leader><leader>d <Plug>VerilogEmacsAutoDelete", vlog_group)
vlog_bind(
    "nnoremap <buffer> <leader>v : py3 try_show_frame() <CR> <C-w>h <CR> : set filetype=verilog<CR>",
    vlog_group
)
vlog_bind(
    "nnoremap <buffer> <leader>i : py3 try_go_into_submodule() <CR> : py try_show_frame() <CR> : py try_print_module_trace() <CR>",
    vlog_group
)
vlog_bind(
    "nnoremap <buffer> <leader>u : py3 try_go_upper_module() <CR> : py try_show_frame() <CR> : py try_print_module_trace() <CR>",
    vlog_group
)
vlog_bind("nnoremap <buffer> <leader>mt      : py3 try_print_module_trace()        <CR>", vlog_group)
vlog_bind("nnoremap <buffer> <leader>ct      : py3 clear_trace()                   <CR>", vlog_group)
vlog_bind("nnoremap <buffer> <leader><Left>  : py3 try_trace_signal_sources()      <CR>", vlog_group)
vlog_bind("nnoremap <buffer> <leader><Right> : py3 try_trace_signal_destinations() <CR>", vlog_group)
vlog_bind("nnoremap <buffer> gi              : py3 try_go_into_submodule()           <CR>", vlog_group)
vlog_bind("nnoremap <buffer> gu              : py3 try_go_upper_module()             <CR>", vlog_group)
vlog_bind("nnoremap <buffer> mt              : py3 try_print_module_trace()          <CR>", vlog_group)
vlog_bind("nnoremap <buffer> ct              : py3 clear_trace()                     <CR>", vlog_group)
vlog_bind("nnoremap <buffer> <Space><Down>   : py3 try_roll_back()                   <CR>", vlog_group)
vlog_bind("nnoremap <buffer> <Space><Up>     : py3 try_go_forward()                  <CR>", vlog_group)
vlog_bind("nnoremap <buffer> <Space>c        : py3 try_add_check_point()             <CR>", vlog_group)
vlog_bind("nnoremap <buffer> <Space>b        : py3 try_add_base_module()             <CR>", vlog_group)
vlog_bind("nnoremap <buffer> <Space>         : py3 try_space_operation()             <CR>", vlog_group)
vlog_bind("nnoremap <buffer> <Space>s        : py3 try_save_env_snapshort()          <CR>", vlog_group)
vlog_bind("nnoremap <buffer> <Space>r        : py3 try_reload_env_snapshort()        <CR>", vlog_group)

vim.keymap.set("n", "<leader>vt", ":source " .. vtags_path .. " <CR>")
vim.cmd([[source $HOME/dotfiles/vim/verilog_emacsauto.vim]])
