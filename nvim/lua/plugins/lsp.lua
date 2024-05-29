return {

    {
        "soulis-1256/eagle.nvim",
        lazy = VeryLazy,
        config = function()
            require("eagle").setup()
            vim.o.mousemoveevent = true
        end,
    },
    {
        "neovim/nvim-lspconfig",
        events = {"BufReadPre", "BufNewFile"},
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
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
                --verible = {},
            },
        },
        config = function(_, opts)
            local servers = opts.servers
            -- We don't have a reason for vim.tbl_deep_extend with the vim defaults
            -- since we weren't using it in the original nvim config. We can
            -- add that back in if we have problems. 
            local capabilities = {require("cmp_nvim_lsp").default_capabilities()}

            -- We loop through our set servers and then assign the default 
            -- lsp capabilities and override them with custom options set 
            -- in the server tables above. 
            for server, base_server_opts in pairs(servers) do
                local server_opts = vim.tbl_deep_extend("force", { 
                    capabilities = vim.deepcopy(capabilities), },
                    base_server_opts or {}) 
                require("lspconfig")[server].setup(server_opts)
            end

            -- In the past, we used a custom_lsp_attach function to set the keybinds for the LSP servers
            -- This time, we are going to use LSP events to trigger the keybind loading. One downside to this
            -- is that the event will only be triggered for the first LSP that is loaded for a given file. 
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)

                    local ts = require("telescope.builtin")

                    -- Function to allow us to map keybinds without getting into the details
                    local function map (mode, l, r, desc)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, {buffer = bufnr, desc = desc})
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

                    -- Not sure how code_lens and inlay_hints work for the LSP setup. Do some research into these if we want them.
                    
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

                    ---- Set up inlay hints
                    --if opts.inlay_hints.enabled and vim.lsp.buf.inlay_hint then
                    --    if client.server_capabilities.inlayHintProvider then
                    --        vim.lsp.buf.inlay_hint(bufnr, true)
                    --    end
                    --    map("n", "<leader>cth", function()
                    --        vim.lsp.buf.inlay_hint(0, nil)
                    --    end, "Toggle inlay hints")
                    --end
                    --
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

                    map("n", "glf",
                        function()
                            vim.lsp.buf.format ({ async = true })
                        end,
                        "Format code"
                    )

                    map("n", "glj", vim.diagnostic.goto_next, "Next LSP error")
                    map("n", "glk", vim.diagnostic.goto_prev, "Previous LSP Error")
                    map("n", "glwd", ts.diagnostics, opts)

                    -- map("n", "glp", vim.lsp.buf.execute_command, opts)
                    -- map("n", "gltd", vim.lsp.buf.type_definition, opts)
                    -- map("n", "glwl", function()
                    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    -- end, opts)
                    -- map("n", "glws", ts.lsp_workspace_symbols, opts)
                    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                        vim.lsp.handlers.hover, {
                            border = "single"
                        }
                    )
                end,
                })
        end,
    },
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        -- lazy = true,
        --keys = {
        --    "<leader>mc",
        --    function()
        --        require("metals").commands()
        --    end,
        --    desc = "Show metals commands",
        --},
        config = function()
            -- This is where the metals setup exists
            local metals_config = require("metals").bare_config()

            metals_config.settings = {
                showImplicitArguments = true,
                enableSemanticHighlighting = false,
                excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
            }

            metals_config.root_patterns = { "build.sbt", "build.sc" }

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

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            metals_config.init_options.statusBarProvider = "on"
            metals_config.capabilities = capabilities

            local lsp_metals = vim.api.nvim_create_augroup("lsp_metals", {clear = true})
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
        "williamboman/nvim-lsp-installer",
        dependencies = {"neovim/nvim-lspconfig"},
        after = {"cmp-nvim-lsp"},
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.verible_verilog_format.with({
                        extra_filetypes = { "verilog_systemverilog" },
                        extra_args = {"--column_limit=120"},
                    }),
                }
            })
        end,
    },
}
