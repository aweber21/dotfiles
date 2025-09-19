--[[
None-ls
    - Wraps Formatters and Linters installed from Mason in a generalized Lsp
      so that Neovim's native Lsp tool can use it.
--]]

return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            -- Modules
            local null_ls = require("null-ls")

            -- Setup
            null_ls.setup({
                sources = {
                    -- Lua
                    null_ls.builtins.formatting.stylua,
                },
            })

            -- Keybinds
            vim.keymap.set("n", "<Leader>cf", function()
                vim.lsp.buf.format()
                vim.cmd(":retab")
            end, { desc = "Format" })
        end,
    },
}
