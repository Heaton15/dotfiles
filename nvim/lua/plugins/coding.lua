return {
    {
        "sustech-data/wildfire.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {},
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
    {
        'saghen/blink.cmp',
        lazy = false, -- lazy loading handled internally
        dependencies = 'rafamadriz/friendly-snippets',
        version = 'v0.*',
        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- see the "default configuration" section below for full documentation on how to define
            -- your own keymap.
            keymap = { preset = 'default' },

            -- default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, via `opts_extend`
            sources = {
                completion = {
                    enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
                },
            },

            -- experimental auto-brackets support
            -- completion = { accept = { auto_brackets = { enabled = true } } }

            -- experimental signature help support
            -- signature = { enabled = true }
        },
    },
}
