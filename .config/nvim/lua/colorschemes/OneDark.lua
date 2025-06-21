--[[
OneDark
    > path/colorschemes/start/onedark.nvim
--]]

-- Modules
local onedark = require("onedark")

-- Setup
onedark.setup({
	style = "dark",
	transparent = true,
})

-- Load
onedark.load()

-- Set colorscheme (redundant of load)
vim.cmd.colorscheme("onedark")
