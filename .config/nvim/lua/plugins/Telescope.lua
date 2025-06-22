--[[
Telescope
    > pack/plugins/start/telescope.nvim
Telescope-UI-Select
    > pack/plugins/start/telescope-ui-select.nvim

Dependencies:
Plenary (plenary.nvim)
    > pack/plugins/start/plenary.nvim
Ripgrep (ripgrep)
    > pack/plugins/start/ripgrep
--]]

-- Modules
local telescope = require("telescope")
local telescope_builtin = require("telescope/builtin")

-- Setup
telescope.setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
        },
    },
})

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension("ui-select")

-- Keymaps
vim.keymap.set("n", "<Leader>ff", telescope_builtin.find_files, {})
vim.keymap.set("n", "<Leader>fg", telescope_builtin.live_grep, {})
