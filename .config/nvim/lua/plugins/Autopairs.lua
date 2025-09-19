--[[
Autopairs
    - A tool to automatically insert pairs of brackets or quotes
--]]

return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            -- Modules
            local autopairs = require("nvim-autopairs")

            -- Setup
            autopairs.setup({})
        end,
    },
}
