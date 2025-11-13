return {
    {
        "coder/claudecode.nvim",
        dependencies = { "folke/snacks.nvim" },
        config = true,
        keys = {
            { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
            { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
            { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
            { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
            { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
            { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
            { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
            {
                "<leader>as",
                "<cmd>ClaudeCodeTreeAdd<cr>",
                desc = "Add file",
                ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
            },
            -- Diff management
            { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
            { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
        },
        opts = {
            terminal = { split_side = "left", },
        }
    },
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "hudson-trading/slang-server.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "neovim/nvim-lspconfig",
        events = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "saghen/blink.cmp",
        },
        opts = {
            inlay_hints = {
                enabled = true,
            },
            -- Add the LSP servers and server customizations here
            servers = {
                slang_server = {},
                rust_analyzer = {},
                pyright = {},
                clangd = {},
                --verible = {
                --  cmd = { "verible-verilog-ls",
                --    "--lsp_enable_hover",
                --    "--enum_assignment_statement_alignment=align"
                --  },
                --  filetypes = { "verilog" },
                --},
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = 'LuaJIT' },
                            workspace = {
                                checkThirdParty = false,
                                library = vim.api.nvim_get_runtime_file("", true)
                            },
                        },
                    },
                },
                ts_ls = {},
            },
        },

        config = function(_, opts)
            ---- Update the signs for LSP information
            --local signs = { Error = "🛑", Warn = "⚠️", Hint = "💡", Info = "🟢" }

            --for type, icon in pairs(signs) do
            --    local hl = "DiagnosticSign" .. type
            --    vim.diagnostic.config({
            --        signs = { text = { icon }, texthl = { hl }, numhl = { hl } },
            --    })
            --end

            local underlines = {
                Error = { undercurl = false },
                Warn  = { undercurl = false },
                Hint  = { undercurl = false },
                Info  = { undercurl = false }
            }

            -- Disable underlines for LSP info
            for type, fields in pairs(underlines) do
                vim.api.nvim_set_hl(0, "DiagnosticUnderline" .. type, { undercurl = fields.undercurl })
            end
            local servers = opts.servers

            for server, config in pairs(servers) do
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
                vim.lsp.enable(server)
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    assert(client, "LSP client was not found")

                    local ts = require("telescope.builtin")

                    local function map(mode, l, r, desc)
                        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                    end

                    -- Set up inlay hints
                    if opts.inlay_hints.enabled and vim.lsp.inlay_hint then
                        if client.server_capabilities.inlayHintProvider then
                            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                        end
                        map("n", "<leader>cth", function()
                            vim.lsp.inlay_hint.enable(
                                not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
                                { bufnr = bufnr }
                            )
                        end, "Toggle inlay hints")
                    end

                    map("n", "gla", vim.lsp.buf.code_action, "Run code action")
                    map("n", "gln", vim.lsp.buf.rename, "Rename")
                    map("n", "glx", client.stop, "Stop client")
                    map("n", "gld", ts.lsp_definitions, "Go to definition")
                    map("n", "glD", vim.lsp.buf.declaration, "Go to declaration")
                    map("n", "glh", vim.lsp.buf.hover, "Hover")
                    map("n", "glH", vim.lsp.buf.signature_help, "Signature help")
                    map("n", "gli", ts.lsp_implementations, "Go to implementation")
                    map("n", "glr", ts.lsp_references, "Go to references")
                    map("n", "glR", ts.lsp_type_definitions, "Go to ")
                    map("n", "gldws", ts.lsp_dynamic_workspace_symbols, "Open dynamic workspace symbols")
                    map("n", "glds", ts.lsp_document_symbols, "Open document symbols")
                    map("n", "<leader>sd", function() Snacks.picker.diagnostics() end, "Diagnostics")
                    map("n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, "Buffer Diagnostics")
                    map("n", "glj", function() vim.diagnostic.jump({ count = 1 }) end, "Next LSP error")
                    map("n", "glk", function() vim.diagnostic.jump({ count = -1 }) end, "Previous LSP Error")
                    map("n", "glwd", function() ts.diagnostics() end, "Display diagnostics in Telescope")
                    map("n", "glws", function() ts.lsp_workspace_symbols() end)
                end,
            })
        end,
    },
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            -- Keybinds
            vim.keymap.set("n", "<leader>mc", ":Telescope metals commands <CR>")

            -- This is where the metals setup exists
            local metals_config = require("metals").bare_config()

            metals_config.settings = {
                enableSemanticHighlighting = false,
                excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
                inlayHints = {
                    hintsInPatternMatch = { enable = false },
                    implicitArguments = { enable = false },
                    implicitConversions = { enable = false },
                    inferredTypes = { enable = false },
                    typeParameters = { enable = false },
                },
            }

            metals_config.root_patterns = { "build.sbt", "build.sc", "build.mill" }

            metals_config.find_root_dir = function(patterns, startpath)
                local Path = require("plenary.path")
                local root_dir = nil
                local path = Path:new(startpath)
                for _, parent in ipairs(path:parents()) do
                    for _, pattern in ipairs(patterns) do
                        local target = Path:new(parent, pattern)
                        if target:exists() then
                            root_dir = parent
                        end
                    end
                end
                return root_dir
            end

            metals_config.init_options.statusBarProvider = "on"

            local lsp_metals = vim.api.nvim_create_augroup("lsp_metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "scala, sbt" },
                callback = function()
                    require("metals").initialize_or_attach(metals_config)
                end,
                group = lsp_metals,
            })
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        opts = {
            formatters_by_ft = {
                python = { "ruff_format" },
                lua = { "stylua" },
                verilog = { "verible" },
            },
        },
        config = function(_, opts)
            require("conform").setup(opts)

            vim.keymap.set("n", "glf", function()
                require("conform").format({
                    lsp_format = "prefer",
                    async = true,
                })
            end, { desc = "Format document" })
        end,
    },
}
