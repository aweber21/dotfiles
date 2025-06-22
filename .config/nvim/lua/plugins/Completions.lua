--[[
Nvim-Cmp
    - Neovim completion tool that handles the window popup to select
      completions and snippets.
    > pack/plugins/start/nvim-cmp
LuaSnip
    - Expands snippets within Nvim-Cmp
    > pack/plugins/start/LuaSnip
Cmp_LuaSnip
    - Completes LuaSnip snippets
    > pack/plugins/start/cmp_luasnip
Friendly-Snippets
    - Allows for the usage of VS Code style snippets
    > pack/plugins/start/friendly-snippets
--]]

-- Modules
local nvim_cmp = require("cmp")
local luasnip = require("luasnip")

-- Setup
nvim_cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = nvim_cmp.config.window.bordered(),
        documentation = nvim_cmp.config.window.bordered(),
    },
    mapping = nvim_cmp.mapping.preset.insert({
        ["<C-b>"] = nvim_cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = nvim_cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = nvim_cmp.mapping.complete(),
        ["<C-e>"] = nvim_cmp.mapping.abort(),
        ["<CR>"] = nvim_cmp.mapping.confirm({ select = true }),
    }),
    sources = nvim_cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
    }),
})

-- Load VS Code Snippets
require("luasnip.loaders.from_vscode").lazy_load({})
