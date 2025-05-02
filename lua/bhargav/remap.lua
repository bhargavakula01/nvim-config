vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Clear highlight" })
vim.api.nvim_set_keymap('n', 'b', 'N', { noremap = true, silent = true })
-- Bind '1' to move to end of line ($)
vim.keymap.set("n", "2", "$", { noremap = true, silent = true })
-- Bind '2' to move to first non-whitespace character (^)
vim.keymap.set("n", "1", "^", { noremap = true, silent = true })
