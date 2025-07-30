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
        "robitx/gp.nvim",
        config = function()
            vim.keymap.set({ "n", "v" }, "<C-4>", function()
                local Snacks = require("snacks")
                local commands = {
                    { name = "New Chat",        cmd = "GpChatNew popup" },
                    { name = "Toggle Chat",     cmd = "GpChatToggle popup" },
                    { name = "Find Chat",       cmd = "GpChatFinder" },
                    { name = "Replace Chat",    cmd = "GpRewrite" },
                    { name = "Append Chat",     cmd = "GpAppend" },
                    { name = "Prepend Chat",    cmd = "GpPrepend" },
                    { name = "New Buffer Chat", cmd = "GpEnew" },
                    { name = "New Tab Chat",    cmd = "GpTabnew" },
                    { name = "New Popup Chat",  cmd = "GpPopup" },
                }

                local items = {}
                local longest_name = 0
                for i, entry in ipairs(commands) do
                    table.insert(items, {
                        idx = i,
                        score = i,
                        name = entry.name,
                        text = entry.cmd,
                    })
                    longest_name = math.max(longest_name, #entry.name)
                end
                longest_name = longest_name + 2

                return Snacks.picker({
                    items = items,
                    format = function(item)
                        return {
                            { ('%-' .. longest_name .. 's'):format(item.name), 'SnacksPickerLabel' },
                            { item.text,                                       'SnacksPickerComment' },
                        }
                    end,
                    confirm = function(picker, item)
                        picker:close()
                        vim.cmd(item.text)
                    end,
                })
            end, { desc = "Open ChatGPT picker" })
            local function keymapOptions(desc)
                return {
                    noremap = true,
                    silent = true,
                    nowait = true,
                    desc = "GPT prompt " .. desc,
                }
            end

            -- Chat commands
            vim.keymap.set("v", "<C-g>p", ":<C-u>'<,'>GpChatPaste popup<cr>", keymapOptions("Visual Chat Paste"))
            vim.keymap.set("v", "<C-g>t", ":<C-u>'<,'>GpChatToggle<cr>", keymapOptions("Visual Toggle Chat"))
            vim.keymap.set({ "n", "i" }, "<C-g>t", "<cmd>GpChatToggle<cr>", keymapOptions("Toggle Chat"))
            vim.keymap.set({ "n", "i" }, "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", keymapOptions("New Chat vsplit"))
            vim.keymap.set("v", "<C-g><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", keymapOptions("Visual Chat New vsplit"))

            -- Rewriting Prompts
            vim.keymap.set({ "n", "i" }, "<C-g>r", "<cmd>GpRewrite<cr>", keymapOptions("Inline Rewrite"))
            vim.keymap.set({ "n", "i" }, "<C-g>a", "<cmd>GpAppend<cr>", keymapOptions("Append (after)"))
            vim.keymap.set({ "n", "i" }, "<C-g>b", "<cmd>GpPrepend<cr>", keymapOptions("Prepend (before)"))
            vim.keymap.set("v", "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", keymapOptions("Visual Rewrite"))
            vim.keymap.set("v", "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", keymapOptions("Visual Append (after)"))
            vim.keymap.set("v", "<C-g>b", ":<C-u>'<,'>GpPrepend<cr>", keymapOptions("Visual Prepend (before)"))

            vim.keymap.set("v", "<C-g><C-x>", ":<C-u>'<,'>GpChatNew split<cr>", keymapOptions("Visual Chat New split"))
            vim.keymap.set("v", "<C-g><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", keymapOptions("Visual Chat New tabnew"))
            vim.keymap.set("v", "<C-g>i", "<cmd>'<,'>GpImplement<CR>", keymapOptions("Implement selection"))

            -- Popup Prompts
            vim.keymap.set({ "n", "i" }, "<C-g>gp", "<cmd>GpPopup<cr>", keymapOptions("Popup"))
            vim.keymap.set({ "n", "i" }, "<C-g>ge", "<cmd>GpEnew<cr>", keymapOptions("GpEnew"))
            vim.keymap.set({ "n", "i" }, "<C-g>gn", "<cmd>GpNew<cr>", keymapOptions("GpNew"))
            vim.keymap.set({ "n", "i" }, "<C-g>gv", "<cmd>GpVnew<cr>", keymapOptions("GpVnew"))
            vim.keymap.set({ "n", "i" }, "<C-g>gt", "<cmd>GpTabnew<cr>", keymapOptions("GpTabnew"))
            vim.keymap.set("v", "<C-g>gp", ":<C-u>'<,'>GpPopup<cr>", keymapOptions("Visual Popup"))
            vim.keymap.set("v", "<C-g>ge", ":<C-u>'<,'>GpEnew<cr>", keymapOptions("Visual GpEnew"))
            vim.keymap.set("v", "<C-g>gn", ":<C-u>'<,'>GpNew<cr>", keymapOptions("Visual GpNew"))
            vim.keymap.set("v", "<C-g>gv", ":<C-u>'<,'>GpVnew<cr>", keymapOptions("Visual GpVnew"))
            vim.keymap.set("v", "<C-g>gt", ":<C-u>'<,'>GpTabnew<cr>", keymapOptions("Visual GpTabnew"))

            local config = {

                providers = {
                    openai = {
                        endpoint = "https://api.openai.com/v1/chat/completions",
                        secret = os.getenv("OPENAI_API_KEY"),
                    },
                },
                agents = {
                    {
                        name = "ChatGPT3-5",
                        disable = true,
                    },
                },


                openai_api_key = os.getenv("OPENAI_API_KEY")
                -- For customization, refer to Install > Configuration in the Documentation/Readme
            }
            require("gp").setup(config)

            -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
        end,
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
    {
        "shumphrey/fugitive-gitlab.vim",
        dependencies = { "tpope/vim-fugitive" },
        config = function()
            vim.g.fugitive_gitlab_domains = {
                "git@gitlab-ext.galois.com",
                "https://gitlab-ext.galois.com",
            }
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
