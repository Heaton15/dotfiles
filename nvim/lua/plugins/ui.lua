return {
    -- Provides icons for various file types
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {"preservim/vimux"},
    {"lervag/vimtex", lazy = false,},
    {"karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup {}
        end,
    },
    {"tpope/vim-fugitive",
        config = function()
            -- Vim-Fugitive Custom binds
            vim.keymap.set("n", "<leader>o", ":only <CR>")
            vim.keymap.set("n", "<leader>gp", ":Git push")
            vim.keymap.set("n", "<leader>gf", ":Git fetch -p <CR>")
            vim.keymap.set("n", "<leader>gs", ":Git <CR> :only <CR>")
            vim.keymap.set("n", "<leader>gl", ":Git log --decorate <CR> :only <CR>")
            vim.keymap.set("n", "<leader>go", ":Git log -p % <CR>")
            vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit!")
            vim.keymap.set("n", "<leader>gdh", ":diffget //2")
            vim.keymap.set("n", "<leader>gdl", ":diffget //3")
            vim.keymap.set("n", "<leader>nc", "]c")
            vim.keymap.set({"n", "v"}, "<leader>gb", ":GBrowse <CR>")
        end,
    },
    {"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        name = "lsp_lines.nvim",
        event = "VeryLazy",
        keys = {
            {
            "<leader>ctl",
            function()
                require("lsp_lines").toggle()
            end,
            desc = "Toggle lsp_lines",
            },
        },
        config = function()
            require("lsp_lines").setup()
            vim.diagnostic.config({virtual_text = false})
        end,
    },
    {"stevearc/dressing.nvim", event = "VeryLazy"},
    {"tpope/vim-rhubarb"},
    {"shumphrey/fugitive-gitlab.vim",
        dependencies = {"tpope/vim-fugitive"},
        config = function()
            vim.g.fugitive_gitlab_domains = {
                "git@gitlab-ext.galois.com",
                "https://gitlab-ext.galois.com",
            }
        end,
    },
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

