return {
    {"preservim/vimux"},
    {"lervag/vimtex", lazy = false,},
    {"karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup {}
        end,
    },
    {"tpope/vim-fugitive"},
    {"christoomey/vim-tmux-navigator"},
    {"junegunn/fzf.vim"},
    {"vhda/verilog_systemverilog.vim"},
    {"vim-scripts/tcl.vim--smithfield"},
    {"https://github.com/tarikgraba/vim-lefdef.git"},
    {"kshenoy/vim-signature"},
    {
        "rcarriga/nvim-notify",
        opts = {
            timeout = 3000,
            stages = "fade",
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { focusable = false })
            end,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
            config = function(_, opts)
                require("notify").setup(opts)
                vim.notify = require("notify")
            end,
        },
    },
}

