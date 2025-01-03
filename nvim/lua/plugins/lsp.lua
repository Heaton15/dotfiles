return {

    {
        "williamboman/mason.nvim",
        opts = {},
    },

    {
        "soulis-1256/eagle.nvim",
        lazy = "VeryLazy",
        config = function()
            require("eagle").setup()
            vim.o.mousemoveevent = true
        end,
    },

    {
        "neovim/nvim-lspconfig",
        events = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "soulis-1256/eagle.nvim",
        },
        opts = {
            inlay_hints = {
                enabled = true,
            },
            -- Add the LSP servers and server customizations here
            servers = {
                pyright = {},
                clangd = {},
                verible = {
                    filetypes = { "verilog_systemverilog" },
                },
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
            },
        },

        config = function(_, opts)
            local servers = opts.servers
            -- We don't have a reason for vim.tbl_deep_extend with the vim defaults
            -- since we weren't using it in the original nvim config. We can
            -- add that back in if we have problems.

            for server, server_opts in pairs(servers) do
                require("lspconfig")[server].setup(server_opts)
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)

                    local ts = require("telescope.builtin")

                    local function map(mode, l, r, desc)
                        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                    end

                    -- Create a variable with the client capabilities that we can reference
                    --local cap = client.server_capabilities

                    ---- Highlight the symbol under the cursor
                    ---- This is neat since the event will cause the LSP command to active
                    --if cap.documentHighlightProvider then
                    --    local lsp_highlight_cursor = vim.api.nvim_create_augroup("lsp_highlight_cursor", {})
                    --    vim.api.nvim_create_autocmd("CursorHold", {
                    --        callback = vim.lsp.buf.document_highlight,
                    --        buffer = bufnr,
                    --        group = lsp_highlight_cursor,
                    --    })
                    --    vim.api.nvim_create_autocmd("CursorMoved", {
                    --        callback = vim.lsp.buf.clear_references,
                    --        buffer = bufnr,
                    --        group = lsp_highlight_cursor,
                    --    })
                    --end

                    -- Not sure how code_lens and work for the LSP setup. Do some research into these if we want them.

                    ---- Set up code lens support
                    --if cap.code_lens then
                    --    local lsp_code_lens = vim.api.nvim_create_augroup("lsp_code_lens", {})
                    --    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                    --        callback = function()
                    --            vim.lsp.codelens.refresh()
                    --        end,
                    --        buffer = bufnr,
                    --        group = lsp_code_lens,
                    --    })
                    --    map("n", "<leader>ccl", vim.lsp.codelens.run, "Run code lens")
                    --end

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
                    map("n", "glj", vim.diagnostic.goto_next, "Next LSP error")
                    map("n", "glk", vim.diagnostic.goto_prev, "Previous LSP Error")
                    -- map("n", "glwd", ts.diagnostics, opts)
                    -- map("n", "glws", ts.lsp_workspace_symbols, opts)
                    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                        border = "single",
                    })
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

            -- Tynan dotfiles which finds the last directory with the highest level root file.
            -- This is needed in chipyard since there are so many build.sbt files all over the place.
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
