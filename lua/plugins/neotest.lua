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
                "<leader>n",
                group = "🧪 Test",
                nowait = true,
                remap = false,
            },
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
                "<leader>nw",
                function()
                    require("neotest").watch.watch(vim.fn.expand("%"))
                end,
                desc = "Start watch"
            },
            {
                "<leader>nwc",
                function()
                    require("neotest").watch.stop(vim.fn.expand("%"))
                end,
                desc = "Stop watch"
            },
            {
                "<leader>nr",
                "<cmd>lua require('neotest').run.run()<cr>",
                desc = "Run nearest test",
            },
            {
                "<leader>nf",
                "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
                desc = "Run current file",
            },
            {
                "<leader>na",
                "<cmd>lua require('neotest').run.run({ suite = true })<cr>",
                desc = "Run all tests",
            },
            {
                "<leader>nd",
                "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
                desc = "Debug nearest test",
            },
            {
                "<leader>ns",
                "<cmd>lua require('neotest').run.stop()<cr>",
                desc = "Stop test",
            },
            {
                "<leader>nn",
                "<cmd>lua require('neotest').run.attach()<cr>",
                desc = "Attach to nearest test",
            },
            {
                "<leader>no",
                "<cmd>lua require('neotest').output.open()<cr>",
                desc = "Show test output",
            },
            {
                "<leader>np",
                "<cmd>lua require('neotest').output_panel.toggle()<cr>",
                desc = "Toggle output panel",
            },
            {
                "<leader>nv",
                "<cmd>lua require('neotest').summary.toggle()<cr>",
                desc = "Toggle summary",
            },
            {
                "<leader>nc",
                "<cmd>lua require('neotest').run.run({ suite = true, env = { CI = true } })<cr>",
                desc = "Run all tests with CI",
            },
        }
    }
}
