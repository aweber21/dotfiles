--[[
OneDark
    - Colorscheme
--]]

return {
    "navarasu/onedark.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins
    config = function()
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
    end,
}
