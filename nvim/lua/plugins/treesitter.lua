-- treesiter configurations
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function()
        return {
            ensure_installed = {
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
                --"verilog",
                "yaml",
                --"devicetree",
                "cmake",
            },
            highlight = { enable = true },
            rainbow = { enable = true },
        }
    end,
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
