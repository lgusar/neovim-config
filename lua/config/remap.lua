vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File explorer" })
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>ff", vim.cmd.LspZeroFormat, { desc = "Format" })

vim.keymap.set('n', '<leader>cr', vim.diagnostic.goto_next, {desc = "Check error" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })

vim.keymap.set('n', '<leader>tt', '<CMD>tabnew<CR>', { desc = "New tab" })
vim.keymap.set('n', '<leader>tn', '<CMD>tabnext<CR>', { desc = "Next tab" })
vim.keymap.set('n', '<leader>tp', '<CMD>tabprev<CR>', { desc = "Prev tab" })

vim.keymap.set('v', '<leader>y', '"+y', opts)

vim.keymap.set('x', 'p', '"_dP', { desc = '[P]ut without yanking' })
