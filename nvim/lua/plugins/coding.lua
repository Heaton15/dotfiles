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
        --dependencies = 'rafamadriz/friendly-snippets',
        dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        version = '*',
        opts = {
            snippets = {
                expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
                active = function(filter)
                    if filter and filter.direction then
                        return require('luasnip').jumpable(filter.direction)
                    end
                    return require('luasnip').in_snippet()
                end,
                jump = function(direction) require('luasnip').jump(direction) end,
            },
            keymap = {
                ["<C-n>"] = { "select_next", "snippet_forward" },
                ["<C-p>"] = { "select_prev", "snippet_backward" },
            },
            completion = {
                list = {
                    -- auto completes the LSP options
                    selection = { auto_insert = true }
                },
                menu = {
                    max_height = 30,
                },
            },

            sources = {
                default = { 'lsp', 'path', 'buffer' },
                cmdline = {},
            },
        },
        opts_extend = { "sources.default" }
    },
}
