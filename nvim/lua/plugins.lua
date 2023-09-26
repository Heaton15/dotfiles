-- Contains the packer plugin calls
return require("packer").startup(function()

    -- Plugin manager install
    use({"wbthomason/packer.nvim"})

    -- Useful lua functions for nvim
    use({"nvim-lua/plenary.nvim"})

    -- Colorscheme
    use({
        "EdenEast/nightfox.nvim",
        config = function()
            require("config.nightfox")
        end
    })

    use({
        "talha-akram/noctis.nvim"
    })

    -- Allow nvim / tmux to operate together
    use({"benmills/vimux"})

    -- vimtex commands for vim
    use({"lervag/vimtex"})

    use({'karb94/neoscroll.nvim'})

    -- git management plugin
    use({"tpope/vim-fugitive"})

    use({"https://github.com/tarikgraba/vim-lefdef.git"})
    use({"junegunn/fzf.vim"})
    use({"vhda/verilog_systemverilog.vim"})
    use({"christoomey/vim-tmux-navigator"})
    use({"vim-scripts/tcl.vim--smithfield"})
    use({"kshenoy/vim-signature"})
    use({"dhruvasagar/vim-table-mode"})

    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.treesitter")
        end,
        run = ":TSUpdate",
    })
    
    use({
        "KeitaNakamura/tex-conceal.vim",
        ft = {'tex'}
    })

    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
        },
        config = function()
            require("config.telescope")
        end,

    })

    use({"hrsh7th/nvim-cmp",
        config = function() 
            require("config.nvim-cmp")
        end,
    })

    use({'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp"})
    use({'hrsh7th/cmp-buffer', after = "nvim-cmp"})
    use({'hrsh7th/cmp-path', after = "nvim-cmp"})
    use({'hrsh7th/cmp-cmdline', after = "nvim-cmp"})
    use({'hrsh7th/cmp-nvim-lsp-signature-help', after = "nvim-cmp"})

    use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})

    -- LSP statusline components
    use({
        "j-hui/fidget.nvim",
        commit = "legacy",
        config = function()
            require("fidget").setup({})
        end,
    })

    -- Common LSP Configurations
    use({
        "williamboman/nvim-lsp-installer",
        {
            'neovim/nvim-lspconfig',
            after = {
                "cmp-nvim-lsp",
            },
            config = function()
                require("config.lsp")
            end
        }
    })

    -- Fancy notification manager
    use({
        "rcarriga/nvim-notify",
        config = function()
            local notify = require("notify")
            notify.setup({
                timeout = 3000,
                stages = "fade",
            })
            vim.notify = notify
        end,
    })

    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "neovim/nvim-lspconfig" },
        },
    })

    use({'m4xshen/autoclose.nvim'})
    --use({'lukas-reineke/indent-blankline.nvim'})


end)
