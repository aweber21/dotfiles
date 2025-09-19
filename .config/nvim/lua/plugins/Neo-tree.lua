--[[
Neo-tree
    - Adds a file browser to Neovim
--]]

return {
    {
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
            local neotree_command = require("neo-tree.command")

            -- Setup
            neotree.setup({
                filesystem = {
                    filtered_items = {
                        visible = true,
                    },
                },
            })

            -- Keymaps
            vim.keymap.set("n", "<Leader>tt", function()
                neotree_command.execute({
                    source = "filesystem",
                    action = "focus",
                    position = "left",
                })
            end, { desc = "Toggle focus" })
            vim.keymap.set("n", "<Leader>to", function()
                neotree_command.execute({
                    source = "filesystem",
                    action = "show",
                    position = "left",
                })
            end, { desc = "Open" })
            vim.keymap.set("n", "<Leader>tc", function()
                neotree_command.execute({
                    source = "filesystem",
                    action = "close",
                    position = "left",
                })
            end, { desc = "Close" })
        end,
    },
}
