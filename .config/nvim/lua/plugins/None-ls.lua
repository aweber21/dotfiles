--[[
None-ls
    - Wraps Formatters and Linters installed from Mason in a generalized Lsp
      so that Neovim's native Lsp tool can use it.
    > pack/plugins/start/none-ls.nvim
--]]

-- Modules
local null_ls = require("null-ls")

-- Setup
null_ls.setup({
	sources = {
		-- Lua
		null_ls.builtins.formatting.stylua,
	},
})

-- Keybindings
vim.keymap.set("n", "<Leader>cf", vim.lsp.buf.format, {})
