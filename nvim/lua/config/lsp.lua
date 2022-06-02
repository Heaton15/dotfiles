-- LSP configurations

local lspconfig = require("lspconfig")

-- Adds cmp as a capability to the lsp autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

--local opts = { noremap=true, silent=true }
--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function custom_lsp_attach(client, bufnr)

    local ts_builtin = require("telescope.builtin")

    local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
    end

    local opts = {
        noremap = true,
        silent = true,
    }

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
    map("n", "gla", vim.lsp.buf.code_action, opts)
    map("v", "gla", vim.lsp.buf.range_code_action, opts)
    map("n", "gld", ts_builtin.lsp_definitions, opts)
    map("n", "glD", vim.lsp.buf.declaration, opts)
    map("n", "glf", function()
        vim.lsp.buf.format({ async = true })
    end, opts)
    map("n", "glh", vim.lsp.buf.hover, opts)
    map("n", "glH", vim.lsp.buf.signature_help, opts)
    map("n", "gli", ts_builtin.lsp_implementations, opts)
    map("n", "glj", vim.diagnostic.goto_next, opts)
    map("n", "glk", vim.diagnostic.goto_prev, opts)
    map("n", "gln", vim.lsp.buf.rename, opts)
    map("n", "glr", ts_builtin.lsp_references, opts)
    map("n", "gltd", vim.lsp.buf.type_definition, opts)
    map("n", "glwd", ts_builtin.diagnostics, opts)
    map("n", "glwl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    map("n", "glws", ts_builtin.lsp_workspace_symbols, opts)
    map("n", "glx", function()
        vim.lsp.stop_client(vim.lsp.get_active_clients())
    end, opts)
end

local servers = {
    "pyright",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = custom_lsp_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  })
end
