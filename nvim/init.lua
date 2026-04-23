require("config.lazy")
require("config.keybinds")
require("config.functions")
require("config.filetypes")
require("config.verilog_autos")

local Path = require("plenary.path")
local work_lua = Path:new(vim.fn.expand("$HOME/.work.lua"))
if work_lua:exists() then
    vim.cmd.source(work_lua.filename)
end
