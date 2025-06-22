--[[
Neo-tree
    > pack/plugins/start/neo-tree.nvim

Dependencies:
Plenary (plenary.nvim)
    > pack/plugins/start/plenary.nvim
Web-Devicons
    > pack/plugins/start/web-devicons
Nui (nui.nvim)
    > pack/plugins/start/nui.nvim
--]]

-- Modules
local neotree = require("neo-tree")

-- Setup
neotree.setup({
    filesystem = {
        filtered_items = {
            visible = true,
        },
    },
})

-- Keymaps
vim.keymap.set("n", "<Leader>t", function()
    vim.cmd(":Neotree filesystem toggle left")
end, {})
