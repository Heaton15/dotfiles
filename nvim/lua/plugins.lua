-- Contains the packer plugin calls
return require("packer").startup(function()

    -- Plugin manager install
    --
    use({"wbthomason/packer.nvim"})

    -- Useful lua functions for nvim
    use({"wbthomason/plenary.nvim"})

    -- Allow nvim / tmux to operate together
    use({"benmills/vimux"})

    -- vimtex commands for vim
    use({"lervag/vimtex"})

    use({"ludovicchabant/vim-gutentags"})

    use({"camspiers/lens.vim"})

    use({"psliwka/vim-smoothie"})

    -- Snippets for neovim
    use({"honza/vim-snippets"})
    --use({"SirVer/ultisnips"})

    -- Better python highlighting
    use({"vim-python/python-syntax"})

    -- git management plugin
    use({"tpope/vim-fugitive"})

    use({"https://github.com/tarikgraba/vim-lefdef.git"})
    use({"junegunn/fzf.vim"})
    --use({"vhda/verilog_systemverilog.vim"})
    use({"godlygeek/tabular"})
    use({"vim-scripts/verilog_emacsauto.vim"})
    use({"junegunn/vim-easy-align"})
    use({"christoomey/vim-tmux-navigator"})
    use({"amal-khailtash/vim-xdc-syntax"})
    use({"justinmk/vim-syntax-extra"})
    use({"vim-scripts/tcl.vim--smithfield"})
    use({"aserebryakov/vim-todo-lists"})
    use({"liuchengxu/vista.vim"})
    use({"kshenoy/vim-signature"})
    use({"dhruvasagar/vim-table-mode"})
    use({"EdenEast/nightfox.nvim"})
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({"nvim-treesitter/completion-treesitter"})
    use({"haorenW1025/completion-nvim"})
    
    use({
        "KeitaNakamura/tex-conceal.vim",
        ft = {'tex'}
    })




    




end)
