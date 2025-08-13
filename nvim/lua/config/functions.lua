-- Function to format selected Verilog range with verible
local function format_verilog_range()
    -- Get the visual selection range
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    local filepath = vim.fn.expand("%:p")

    local cmd = string.format("verible-verilog-format --lines %d-%d --inplace %s",
        start_line, end_line, vim.fn.shellescape(filepath))
    vim.fn.system(cmd)
    vim.cmd("edit!")
end

vim.api.nvim_create_user_command('FormatVerilogRange', format_verilog_range, { range = true })
vim.keymap.set('v', '<F7>', ':FormatVerilogRange<CR>', { desc = 'Format Verilog range' })
