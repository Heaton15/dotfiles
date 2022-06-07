vim.notify = require("notify")
local vtags_version = "https://www.vim.org/scripts/download_script.php?src_id=27765"
local version = "3.10"
local dest = ".vtags-" .. version

-- Curl down vtags and isntall it in the home directory
if vim.fn.filereadable(vim.fn.expand("$HOME/"..dest.."/vtags-"..version.."/vtags_vim_api.vim")) == 0 then
    vim.notify ("No Vtags Detected. ---Installing---", "INFO")
    os.execute ('curl -o ~/.vtags.tar.gz ' .. vtags_version)
    os.execute ('mkdir ~/' ..dest.. ' && tar -xvzf ~/.vtags.tar.gz -C ~/' .. dest)
end

-- Create vtags keybinds. This is pretty clanky compared to other plugins
local vlog_binds= vim.api.nvim_create_augroup("verilog_key_bindings", {})

--vim.api.nvim_create_autocmd(events, { 
--    pattern = {item},
--    command = cmd,
--    group = vlog_binds,
--})

--augroup verilogBindings
--    autocmd! verilogBindings
--    autocmd FileType verilog_systemverilog map <leader>a <Plug>VerilogEmacsAutoAdd :redraw! <CR>
--    autocmd Filetype verilog_systemverilog map <leader><leader>a <Plug>VerilogEmacsAutoAdd
--    autocmd Filetype verilog_systemverilog map <leader>d <Plug>VerilogEmacsAutoDelete :redraw! <CR>
--    autocmd Filetype verilog_systemverilog map <leader><leader>d <Plug>VerilogEmacsAutoDelete
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>v       : py3 try_show_frame()                <CR> <C-w>h <CR> : set filetype=verilog_systemverilog <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>i       : py3 try_go_into_submodule()         <CR> : py try_show_frame() <CR> : py try_print_module_trace() <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>u       : py3 try_go_upper_module()           <CR> : py try_show_frame() <CR> : py try_print_module_trace() <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>mt      : py3 try_print_module_trace()        <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>ct      : py3 clear_trace()                   <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader><Left>  : py3 try_trace_signal_sources()      <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader><Right> : py3 try_trace_signal_destinations() <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  gi              : py3 try_go_into_submodule()           <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  gu              : py3 try_go_upper_module()             <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  mt              : py3 try_print_module_trace()          <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  ct              : py3 clear_trace()                     <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space><Down>   : py3 try_roll_back()                   <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space><Up>     : py3 try_go_forward()                  <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>c        : py3 try_add_check_point()             <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>b        : py3 try_add_base_module()             <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>         : py3 try_space_operation()             <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>s        : py3 try_save_env_snapshort()          <CR>
--    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>r        : py3 try_reload_env_snapshort()        <CR>
--augroup end
