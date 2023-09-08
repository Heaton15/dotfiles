-- treesiter configurations
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "vim",
        "bash",
        --"c",
        --"comment",
        "cpp",
        "html",
        "json",
        --"latex",
        "lua",
        "python",
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
})
