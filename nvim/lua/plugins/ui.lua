return {
    {
        "folke/lazydev.nvim", -- Adds lua paths to LuaLs for module detection with snacks and lazy
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim",        words = { "Snacks" } },
                { path = "lazy.nvim",          words = { "LazyVim" } },
            },
        },
    },
    {
        "bngarren/checkmate.nvim",
        ft = "markdown", -- Lazy loads for Markdown files matching patterns in 'files'
        opts = {},
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            scroll = {
                enabled = true,
                config = {
                    vim.keymap.set("n", "<C-e>", "8<C-e>"),
                    vim.keymap.set("n", "<C-y>", "8<C-y>"),
                },
            },
            picker = {
                enabled = true,
                sources = {
                    diagnostics = {
                        filter = { cwd = false },

                    },
                },
            },
            dashboard = { enabled = true },
            bigfile = { enabled = false },
            explorer = { enabled = false },
            indent = { enabled = false },
            input = { enabled = false },
            notifier = { enabled = false },
            quickfile = { enabled = false },
            scope = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
        },
        keys = {
            { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find Files" },
            { "<leader>fb", function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
            { "<leader>ev", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            { "<leader>fg", function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
            { "<leader>fp", function() Snacks.picker.projects() end,                                desc = "Projects" },
            { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Recent" },
            { "<leader>/",  function() Snacks.picker.grep() end,                                    desc = "Grep" },
            { "<leader>:",  function() Snacks.picker.command_history() end,                         desc = "Command History" },
            { "<leader>n",  function() Snacks.picker.notifications() end,                           desc = "Notification History" },
            { "<leader>gb", function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
            { "<leader>gB", function() Snacks.picker.git_branches({ all = true, }) end,             desc = "Git Branches" },
            { "<leader>sh", function() Snacks.picker.help() end,                                    desc = "Help Pages" },
            { "<leader>sM", function() Snacks.picker.man() end,                                     desc = "Man Pages" },
            { "<leader>uC", function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
            { "<leader>sb", function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
            { "<leader>sB", function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
            { "<leader>sw", function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
            --{ "<leader>gL", function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
            --{ "<leader>gs", function() Snacks.picker.git_status() end,                              desc = "Git Status" },
            --{ "<leader>gS", function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
            --{ "<leader>gd", function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
            --{ "<leader>gf", function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
            -- search
            { '<leader>s"', function() Snacks.picker.registers() end,                               desc = "Registers" },
            { '<leader>s/', function() Snacks.picker.search_history() end,                          desc = "Search History" },
            { "<leader>sa", function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
            { "<leader>sH", function() Snacks.picker.highlights() end,                              desc = "Highlights" },
            { "<leader>si", function() Snacks.picker.icons() end,                                   desc = "Icons" },
            { "<leader>sj", function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
            { "<leader>sk", function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
            { "<leader>sm", function() Snacks.picker.marks() end,                                   desc = "Marks" },
            { "<leader>sp", function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
            { "<leader>sq", function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
            { "<leader>sR", function() Snacks.picker.resume() end,                                  desc = "Resume" },
            { "<leader>su", function() Snacks.picker.undo() end,                                    desc = "Undo History" },

        },
    },
    {
        'saghen/blink.cmp',
        lazy = false,
        dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        version = '*',
        opts = {
            signature = {
                enabled = true,
                window = {
                    show_documentation = true,
                },
                trigger = {
                    show_on_insert = true, -- When accepting a menu item, keep the signature up
                },
            },
            snippets = {
                expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
                active = function(filter)
                    if filter and filter.direction then
                        return require('luasnip').jumpable(filter.direction)
                    end
                    return require('luasnip').in_snippet()
                end,
                jump = function(direction) require('luasnip').jump(direction) end,
            },
            keymap = {
                ["<C-n>"] = { "select_next", "snippet_forward" },
                ["<C-p>"] = { "select_prev", "snippet_backward" },
            },
            completion = {
                list = {
                    -- ghost_text does a nice preemptive auto complete
                    selection = { auto_insert = false }
                },
                menu = {
                    max_height = 30,
                },
                documentation = { auto_show = true },
                ghost_text = {
                    enabled = false,
                },
            },
            sources = {
                default = { 'lsp', 'path', 'buffer', 'lazydev', 'snippets' },

                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                },
            },
        },
        opts_extend = { "sources.default" }
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        cmd = "Telescope",
        opts = {},
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        opts = {},
    },
    -- Provides icons for various file types
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            local uname = vim.fn.system("uname")
            if uname == "Darwin" then
                vim.g.vimtex_view_method = "skim"
            end
        end,
    },
    {
        "tpope/vim-fugitive",
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
            vim.keymap.set({ "n", "v" }, "<leader>G", ":GBrowse <CR>")
        end,
    },
    { "stevearc/dressing.nvim", event = "VeryLazy" },
    { "tpope/vim-rhubarb" },

    --https://github.com/tommcdo/vim-fubitive.git
    {
        "tommcdo/vim-fubitive",
        dependencies = { "tpope/vim-fugitive" },
        config = function()
        end,

    },
    {
        "shumphrey/fugitive-gitlab.vim",
        dependencies = { "tpope/vim-fugitive" },
        config = function()
        end,
    },
    { "christoomey/vim-tmux-navigator" },
    { "junegunn/fzf.vim" },
    { "https://github.com/tarikgraba/vim-lefdef.git" },
    { "kshenoy/vim-signature" },
    {
        "rcarriga/nvim-notify",
        opts = {
            timeout = 3000,
            stages = "fade",
            background_colour = "#000000",
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
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "tabs",
                },
            })
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        config = function(_, opts)
            vim.keymap.set("n", "<C-1>", ":NvimTreeToggle <CR>", { silent = true, noremap = true })
            vim.keymap.set("n", "<C-2>", ":NvimTreeFindFile <CR>", { silent = true, noremap = true })
            vim.keymap.set("n", "<C-3>", ":NvimTreeCollapse <CR>", { silent = true, noremap = true })
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            require("nvim-tree").setup(opts)
        end,
    },
    { "nvim-tree/nvim-web-devicons", lazy = true },
}
