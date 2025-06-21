--[[
Treesitter
    > pack/plugins/start/nvim-treesitter
--]]

-- Modules
local treesitter_configs = require("nvim-treesitter/configs")

-- Setup
treesitter_configs.setup({
	ensure_installed = {
		-- These are installed by default on Arch Linux through other packages
		"c",
		"lua",
		"markdown",
		"markdown_inline",
		"query",
		"vim",
		"vimdoc",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
