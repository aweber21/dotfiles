--[[
Mason
    - Installer for Lsps, Formatters, Linters, and Debuggers.
    > pack/plugins/start/mason.nvim
Mason-LspConfig
    - Middle-man for Mason to auto-install Lsps and for telling Neovim's
      native Lsp tool to use them.
    > pack/plugins/start/mason-lspconfig.nvim
Nvim-LspConfig
    - Neovim's native Lsp tool (uses vim.lsp).
    > pack/plugins/start/nvim-lspconfig
--]]

-- Vim Commands
vim.o.signcolumn = "yes"

-- Modules
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup
mason.setup({})
mason_lspconfig.setup({
	ensure_installed = { "lua_ls" },
	automatic_enable = true,
})
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
			diagnostics = {
				globals = { "vim" },
			},
			capabilities = capabilities,
		},
	},
})
vim.lsp.enable("lua_ls")

-- Keybindings
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, {})
