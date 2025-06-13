return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap",
        },
    },

    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "fredrikaverpil/neotest-golang", -- Installation
            {
                "fredrikaverpil/neotest-golang", -- Installation
                dependencies = {
                    "leoluz/nvim-dap-go",
                },
            },
            "alfaix/neotest-gtest",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-golang"), -- Registration
                },
            })
        end,
        keys = {
            {
                "<leader>dn",
                function()
                    require("neotest").run.run()
                end,
                desc = "Run nearest test",
            },
            {
                "<leader>df",
                function()
                    require("neotest").run.run(vim.fn.expand("%"))
                end,
                desc = "Run tests in the entire file",
            },
            {
                "<leader>dso",
                function()
                    require("neotest").summary.open()
                end,
                desc = "Open test summary",
            },
            {
                "<leader>dsc",
                function()
                    require("neotest").summary.close()
                end,
                desc = "Close test summary",
            },
            {
                "<leader>dsc",
                function()
                    require("neotest").summary.close()
                end,
                desc = "Close test summary",
            },
            {
                "<leader>dws",
                function()
                    require("neotest").watch.watch(vim.fn.expand("%"))
                end,
                desc = "Start watch"
            },
            {
                "<leader>dwc",
                function()
                    require("neotest").watch.stop(vim.fn.expand("%"))
                end,
                desc = "Stop watch"
            },
        }
    },
}
