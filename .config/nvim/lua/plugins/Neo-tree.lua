--[[
Neo-tree
    - Adds a file browser to Neovim
--]]

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- optional image support in preview
        -- window: See '# Preview Mode'
    },
    config = function()
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
    end,
}
