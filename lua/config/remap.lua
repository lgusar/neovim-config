vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File explorer" })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>ff", vim.cmd.LspZeroFormat, { desc = "Format" })
