return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    opts = function()
        return {
            "vim",
            "vimdoc",
            "bash",
            --"c",
            --"comment",
            "cpp",
            "html",
            "json",
            --"latex",
            "lua",
            "python",
            "make",
            "regex",
            --"rst",
            "scala",
            "systemverilog",
            "yaml",
            --"devicetree",
            "cmake",
            "asm",
            "zig",
            "rust",
            "lalrpop",
            "javascript",
            "typescript",
            "typst",
            "tcl",
        }
    end,
    config = function(_, opts)
        require("nvim-treesitter").install(opts)
        for _, ft in ipairs(opts) do
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { ft },
                callback = function() vim.treesitter.start() end,
            })
        end
    end,
}
