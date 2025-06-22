--[[
Mason
    - Installer for Lsps, Formatters, Linters, and Debuggers
Mason-LspConfig
    - Middle-man for Mason to auto-install Lsps and for telling Neovim's
      native Lsp tool to use them
Nvim-LspConfig
    - Neovim's native Lsp tool (uses vim.lsp)
--]]

-- Vim Commands
vim.o.signcolumn = "yes"

return {
    {
        "mason-org/mason.nvim",
        config = function()
            -- Modules
            local mason = require("mason")

            -- Setup
            mason.setup({})
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            -- Modules
            local mason_lspconfig = require("mason-lspconfig")

            -- Setup
            mason_lspconfig.setup({
                ensure_installed = { "lua_ls" },
                automatic_enable = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Modules
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Setup
            vim.diagnostic.config({
                update_in_insert = true,
                signs = true,
                virtual_text = true,
            })

            -- Lsp Configurations
            -- Lua
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        capabilities = capabilities,
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
            vim.lsp.enable("lua_ls")

            -- Keybinds
            vim.keymap.set("n", "<Leader>cc", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<Leader>cd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<Leader>cD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "<Leader>cr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
