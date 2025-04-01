return {
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },
    {
        "dhruvasagar/vim-table-mode",
        event = "VeryLazy",
        config = function()
            local ft = vim.bo.filetype
            if ft == "rst" then
                vim.g.table_mode_corner_corner = [[+]]
                vim.g.table_mode_header_fillchar = [[=]]
            elseif ft == "markdown" then
                vim.cmd("let b:table_mode_corner = '|'")
            end
        end,
    },

    -- Makes creating tables for md, rst, etc a lot easier
    {
        "dhruvasagar/vim-table-mode",
        event = "VeryLazy",
        config = function()
            local ft = vim.bo.filetype
            if ft == "rst" then
                vim.g.table_mode_corner_corner = [[+]]
                vim.g.table_mode_header_fillchar = [[=]]
            elseif ft == "markdown" then
                vim.cmd("let b:table_mode_corner = '|'")
            end
        end,
    },

}
