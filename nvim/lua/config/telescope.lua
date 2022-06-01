--require("telescope").setup({
--    defaults = {
--        mappings = {
--            i = { ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble },
--            n = { ["<C-t>"] = require("trouble.providers.telescope").open_with_trouble },
--        },
--        layout_strategy = "horizontal",
--        layout_config = {
--            prompt_position = "top",
--            width = 0.8,
--        },
--        sorting_strategy = "ascending",
--        winblend = 10,
--    },
--})
--
local tsb = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", tsb.find_files)
vim.keymap.set("n", "<leader>fg", tsb.live_grep)
vim.keymap.set("n", "<leader>fb", tsb.buffers)
vim.keymap.set("n", "<leader>fh", tsb.help_tags)

--require("telescope").load_extension("fzf")
