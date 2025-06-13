local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

 local servers = {
   clangd = {
    cmd = { 'clangd', '--completion-style=detailed' },
   },        -- gopls = {},
-- pyright = {},
-- rust_analyzer = {},
-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
--
-- Some languages (like typescript) have entire language plugins that can be useful:
--    https://github.com/pmizio/typescript-tools.nvim
--
-- But for many setups, the LSP (`ts_ls`) will work just fine
-- ts_ls = {},
--

-- lua_ls = {
--   -- cmd = { ... },
--   -- filetypes = { ... },
--   -- capabilities = {},
--   settings = {
--     Lua = {
--       completion = {
--         callSnippet = 'Replace',
--       },
--       -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
--       -- diagnostics = { disable = { 'missing-fields' } },
--     },
--   },
-- },
}
require("mason").setup({})
require("mason-lspconfig").setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { "clangd" },
    handlers = {
       function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,    
      },
})

require("mason-lspconfig").setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { "clangd" },
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end,
    },
})

local luasnip = require("luasnip")
local cmp = require("cmp")

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
    },

    mapping = cmp.mapping.preset.insert({
        -- Ctrl+Space to trigger completion menu
        ["<C-Space>"] = cmp.mapping.complete(),

        ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if luasnip.expandable() then
                    luasnip.expand()
                else
                    cmp.confirm({
                        select = true,
                    })
                end
            else
                fallback()
            end
        end),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
                cmp.select_next_item()
            elseif vim.snippet.active({ direction = 1 }) then
                vim.schedule(function()
                    vim.snippet.jump(1)
                end)
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.snippet.active({ direction = -1 }) then
                vim.schedule(function()
                    vim.snippet.jump(-1)
                end)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),

    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
})
