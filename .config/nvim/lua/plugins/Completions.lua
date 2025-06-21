--[[
LuaSnip
    - Expands snippets within Nvim-Cmp
Cmp_LuaSnip
    - Completes LuaSnip snippets
Friendly-Snippets
    - Allows for the usage of VS Code style snippets
Cmp-Nvim-Lsp
    - Allows for snippets to come from Lsps
Nvim-Cmp
    - Neovim completion tool that handles the window popup to select
      completions and snippets.
--]]

return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.4",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            -- Load VS Code Snippets
            require("luasnip.loaders.from_vscode").lazy_load({})
        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
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
        end,
    },
}
