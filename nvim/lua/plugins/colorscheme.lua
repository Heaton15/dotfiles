return {
    --{
    --    "talha-akram/noctis.nvim",
    --    lazy = false,
    --    priority = 1000,
    --    config = function()
    --        vim.cmd("colorscheme noctis_obscuro")
    --        vim.cmd([[highlight LineNr guibg=NONE]])
    --    end,
    --},
    
    { 
       "EdenEast/nightfox.nvim",
         lazy = false,
         priority = 1000,
         config = function()
           vim.cmd("colorscheme carbonfox")
           vim.cmd([[highlight LineNr guibg=NONE]])
         end,
    },

    --{
    --   "folke/tokyonight.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   opts = {},
    --   config = function()
    --       vim.cmd("colorscheme tokyonight-moon")
    --   end,
    --},
    
    --{ 
    --    "bluz71/vim-nightfly-colors",
    --    name = "nightfly",
    --    lazy = false,
    --    priority = 1000,
    --    config = function()
    --        vim.cmd("colorscheme nightfly")
    --    end,
    --},
}
