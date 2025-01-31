require("oil").setup({
    default_file_explorer = true,
    view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
    }
})

vim.keymap.set("n", "<leader>pv", function() 
    require("oil").open_float()
end, { desc = "Open file explorer" }
)
