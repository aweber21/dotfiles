--[[
Neo-tree
    - A file browser for Neovim
--]]

return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            -- Modules
            local neotree = require('neo-tree')
            local neotree_command = require('neo-tree/command')

            -- Setup
            neotree.setup({
                sources = {
                    'filesystem',
                    'buffers',
                    'git_status',
                    'document_symbols',
                },
                filesystem = {
                    filtered_items = {
                        visible = true,
                    },
                },
                source_selector = {
                    statusline = true,
                    sources = {
                        { source = 'filesystem' },
                        { source = 'buffers' },
                        { source = 'git_status' },
                        -- { source = 'document_symbols' },
                    },
                },
            })

            -- Keymaps
            vim.keymap.set('n', '<Leader>tt', function()
                neotree_command.execute({
                    source = 'filesystem',
                    action = 'focus',
                    position = 'float',
                    reveal = true,
                    toggle = true,
                })
            end, { desc = 'Toggle floating' })
            vim.keymap.set('n', '<Leader>ts', function()
                neotree_command.execute({
                    source = 'filesystem',
                    action = 'focus',
                    position = 'left',
                    reveal = true,
                    toggle = true,
                })
            end, { desc = 'Toggle side' })
            vim.keymap.set('n', '<Leader>to', function()
                neotree_command.execute({
                    source = 'filesystem',
                    action = 'show',
                    position = 'left',
                    reveal = true,
                })
            end, { desc = 'Open' })
            vim.keymap.set('n', '<Leader>tc', function()
                neotree_command.execute({
                    source = 'filesystem',
                    action = 'close',
                    position = 'left',
                    reveal = true,
                })
            end, { desc = 'Close' })
            vim.keymap.set('n', '<Leader>td', function()
                neotree_command.execute({
                    source = 'document_symbols',
                    action = 'focus',
                    position = 'left',
                    toggle = true,
                })
            end, { desc = 'Toggle document symbols' })
        end,
    },
}
