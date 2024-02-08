return {
    {
        "talha-akram/noctis.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme noctis_obscuro")
            vim.cmd([[highlight LineNr guibg=NONE]])
        end,
    },
}
