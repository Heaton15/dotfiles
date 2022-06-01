-- treesiter configurations
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "c",
        "comment",
        "cpp",
        "html",
        "json",
        "latex",
        "lua",
        "python",
        "regex",
        "rst",
        "scala",
        "verilog",
        "yaml",
        --"devicetree",
    },
    highlight = { enable = true },
    rainbow = { enable = true },
})
