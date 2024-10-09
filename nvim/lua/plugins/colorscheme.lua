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
    --  'keiyakeiya/PapilioDehaanii.vim',
    --  lazy = false,
    --  priority = 1000,
    --  config = function()
    --    vim.cmd("colorscheme papilio_dehaanii")
    --    vim.cmd([[highlight LineNr guibg=NONE]])
    --  end,

    --}
}
