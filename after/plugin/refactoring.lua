-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

vim.keymap.set(
	{"n", "x"},
	"<leader>r",
	function() require('telescope').extensions.refactoring.refactors() end,
    { desc = "Refactor" }
)
