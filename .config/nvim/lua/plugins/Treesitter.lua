--[[
Treesitter
    - Provides syntax highlighting
--]]

return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            -- Modules
            local treesitter_configs = require('nvim-treesitter/configs')

            -- Setup
            treesitter_configs.setup({
                ensure_installed = {
                    -- These are installed by default on Arch Linux through other packages
                    'c',
                    'lua',
                    'markdown',
                    'markdown_inline',
                    'query',
                    'vim',
                    'vimdoc',
                },
                auto_install = true,
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
}
