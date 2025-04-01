return {
  {
    'saghen/blink.cmp',
    lazy = false,
    dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    version = '*',
    opts = {
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
          -- auto completes the LSP options
          selection = { auto_insert = true }
        },
        menu = {
          max_height = 30,
        },
      },
      sources = {
        default = { 'lsp', 'path', 'buffer' },
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
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live grep",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Find buffers",
      },
    },
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
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "preservim/vimux" },
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
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
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
      vim.keymap.set({ "n", "v" }, "<leader>gb", ":GBrowse <CR>")
      vim.keymap.set("n", "<leader>co", require("telescope.builtin").git_branches)
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
}
