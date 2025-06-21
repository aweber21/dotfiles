--[[
Lualine
--]]

return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- Modules
		local lualine = require("lualine")

		-- Setup
		lualine.setup({
			options = {
				theme = "onedark",
			},
		})
	end,
}
