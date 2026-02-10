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
local ft_tcl = { "*.sdc", "*.xel", "*.xdc"}
local ft_vlog = { "*.v", "*.vg", "*.vm", "*.vh", "*.sv", "*.vams"}
local ft_sh = { "*.sh", "*.bash_aliases", "*.bashrc", "*.bash" }
local ft_scala = { "*.mill", "*.scala" }

-- Set certain commonly used files to a filetype
set_ft(buf, ft_sh, "bash", [[tabstop=2 softtabstop=2 shiftwidth=2 textwidth=80 autoindent]])
set_ft(buf, ft_scala, "scala", [[tabstop=2 softtabstop=2 shiftwidth=2 textwidth=80 autoindent]])
set_ft(buf, { "*.scs" }, "spectre")
set_ft(buf, { "*.il" }, "skill", [[tabstop=4 softtabstop=4 textwidth=80 autoindent]])
set_ft(buf, ft_skill, "skill")
set_ft(buf, ft_tcl, "tcl")
set_ft(buf, ft_vlog, "verilog", [[tabstop=2 softtabstop=2 shiftwidth=2 textwidth=120]])
set_ft(buf, {"*.core"}, "yaml")
set_ft(buf, { "*.tex" }, nil, [[setlocal textwidth=80 spell spelllang=en_us]])
set_ft(buf, { "*.py" }, nil, [[set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 autoindent]])
set_ft(buf, { "*.rs" }, nil, [[set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 autoindent formatoptions=cqnlj]])

-- Allows vim-fugitive to fold changes when viewing
set_ft({ "FileType" }, { "git" }, nil, [[setlocal foldmethod=syntax]])
