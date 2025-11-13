-- telescope
local initlua = vim.fn.expand("$HOME/.config/nvim")

vim.keymap.set("v", "<leader>y", "\"*y")
vim.keymap.set("n", "<leader>eb", ":edit $HOME/.bashrc <CR>")
vim.keymap.set("n", "<leader>to", ":edit $HOME/.todo.md <CR>")
vim.keymap.set("n", "<leader>q", ":qa! <CR>")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>ws", "<C-w>s")
vim.keymap.set("n", "<leader>w/", "<C-w>v")

-- Tab movement in nvim
vim.keymap.set("n", "tn", ":tabnew <CR>")
vim.keymap.set("n", "tc", ":tabclose <CR>")
vim.keymap.set("n", "tN", ":tab sball <CR>")
vim.keymap.set("n", "ts", ":tab split <CR>")

-- Move between tabs with leader + num
for i = 1, 9 do
    local key = "<leader>" .. i
    vim.keymap.set("n", key, i .. "gt")
end

vim.keymap.set("n", "<F5>", [[ :set norelativenumber! <CR> :set nonumber! <CR>]])
vim.keymap.set("n", "<F6>", [[ :set nowrap! <CR>]])
vim.keymap.set("n", "<F7>", [[ :set list! <CR>]])

-- Window control in neovim
vim.keymap.set("n", "<leader>l", ":redraw <CR>", { silent = true })
vim.keymap.set("n", "<leader>ww", "<C-w>= <CR>", { silent = true })

-- vim buffer navigation
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set("n", "<leader>wh", ":TmuxNavigateLeft <CR>", { silent = true })
vim.keymap.set("n", "<leader>wj", ":TmuxNavigateDown <CR>", { silent = true })
vim.keymap.set("n", "<leader>wk", ":TmuxNavigateUp <CR>", { silent = true })
vim.keymap.set("n", "<leader>wl", ":TmuxNavigateRight <CR>", { silent = true })

vim.keymap.set("n", "<leader>ctl", function()
    local toggle = not vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = toggle })
end, { desc = "Toggles diagnostic virtual lines" })
