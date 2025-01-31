vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File explorer" })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>ff", vim.cmd.LspZeroFormat, { desc = "Format" })

vim.keymap.set('n', '<leader>cr', vim.diagnostic.goto_next, {desc = "Check error" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
