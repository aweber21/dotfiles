--[[
Which-Key
    - A pop up helper to show key combinations
--]]

return {
    {
        'folke/which-key.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-mini/mini.icons',
        },
        event = 'VeryLazy',
        config = function()
            -- Modules
            local which_key = require('which-key')

            -- Setup
            which_key.setup({
                delay = 1000,
            })

            -- Groups
            which_key.add({
                { '<Leader>t', group = 'Neo-tree' },
                { '<Leader>f', group = 'Files' },
                { '<Leader>c', group = 'Code' },
                { '<Leader>d', group = 'Debugging' },
            })

            -- Keybinds
            vim.keymap.set('n', '<Leader>?', function()
                which_key.show({ global = true })
            end, { desc = 'Open Which-Key' })
        end,
    },
}
