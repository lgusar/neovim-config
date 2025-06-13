local wk = require("which-key")
wk.add({
    { "<leader>t", group = "tabs" },
    { "<leader>c", group = "code actions" },
    { "<leader>f", group = "telescope" },
    { "<leader>g", group = "git" },
    { "<leader>p", group = "files" },
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
})
