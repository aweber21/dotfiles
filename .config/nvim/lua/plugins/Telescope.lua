--[[
Telescope
    - A tool for finding and grepping within a project
Telescope-UI-Select
    - Allows for Telescope-like GUI for selection prompts
--]]

return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
        },
        config = function()
            -- Modules
            local telescope = require('telescope')
            local telescope_builtin = require('telescope/builtin')

            -- Setup
            telescope.setup({
                extensions = {
                    ['ui-select'] = {
                        require('telescope/themes').get_dropdown({}),
                    },
                },
            })

            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            telescope.load_extension('ui-select')

            -- Keymaps
            vim.keymap.set('n', '<Leader>s', telescope_builtin.builtin,
                { desc = 'Telescope' })
            vim.keymap.set('n', '<Leader>ff', telescope_builtin.find_files,
                { desc = 'Find Files' })
            vim.keymap.set('n', '<Leader>fg', telescope_builtin.live_grep,
                { desc = 'Grep Files' })
            vim.keymap.set('n', '<Leader>b', function()
                telescope_builtin.buffers({
                    sort_mru = true,
                })
                vim.api.nvim_input('<Space><Esc>')
            end, { desc = 'Buffers' })
            vim.keymap.set('n', '<Leader>r', function()
                telescope_builtin.registers({})
                vim.api.nvim_input('<Space><Esc>')
            end, { desc = 'Registers' })
            vim.keymap.set('n', '<Leader>m', function()
                telescope_builtin.marks({})
                vim.api.nvim_input('<Space><Esc>')
            end, { desc = 'Marks' })
        end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
    },
}
