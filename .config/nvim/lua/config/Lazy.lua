--[[
Lazy
    - Package manager for Neovim
--]]

-- Installation
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none',
        '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup
require('lazy').setup({
    install = {
        missing = true,
        colorscheme = { 'habamax' },
    },
    checker = {
        enabled = false,
        notify = true,
    },
    change_detection = {
        enabled = false,
        notify = false,
    },
    spec = {
        -- Colorschemes
        { import = 'colorschemes/OneDark' },
        { import = 'colorschemes/VSCode' },

        -- Plugins
        { import = 'plugins/Autopairs' },
        { import = 'plugins/Blink' },
        { import = 'plugins/Lualine' },
        { import = 'plugins/Mason' },
        { import = 'plugins/Neo-tree' },
        { import = 'plugins/Telescope' },
        { import = 'plugins/Treesitter' },
        { import = 'plugins/Which-Key' },
    },
})
