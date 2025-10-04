--[[
Autocommands
    - Configuration of autocommands for Neovim
--]]

-- Highlight on Yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight on Yank',
    group = vim.api.nvim_create_augroup('highlight-on-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
