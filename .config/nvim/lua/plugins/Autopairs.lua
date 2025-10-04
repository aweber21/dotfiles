--[[
Nvim-Autopairs
    - A tool to automatically insert pairs of brackets or quotes
--]]

return {
    {
        'windwp/nvim-autopairs',
        event = 'VeryLazy',
        config = function()
            -- Modules
            local autopairs = require('nvim-autopairs')

            -- Setup
            autopairs.setup({})
        end,
    },
}
