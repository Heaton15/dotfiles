local function set_transparency()
    vim.cmd([[TransparentDisable]])
    if vim.env.TERM == "xterm-ghostty" then
        vim.cmd([[TransparentEnable]])
    end
end

return {
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        dependencies = { 'xiyaowong/transparent.nvim' },
        config = function()
            vim.cmd("colorscheme carbonfox")
            vim.cmd([[highlight LineNr guibg=NONE]])
            set_transparency()
        end,
    },
}
