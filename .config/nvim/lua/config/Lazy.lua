--[[
Lazy
    - Package manager for Neovim
--]]

-- Installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup
require("lazy").setup({
    -- Colorschemes
    -- OneDark
    { import = "colorschemes/OneDark" },

    -- VSCode
    { import = "colorschemes/VSCode" },

    -- Plugins
    -- Telescope, Ripgrep, Telescope-UI-Select
    { import = "plugins/Telescope" },

    -- Treesitter
    { import = "plugins/Treesitter" },

    -- Neo-tree
    { import = "plugins/Neo-tree" },

    -- Lualine
    { import = "plugins/Lualine" },

    -- Which-Key
    { import = "plugins/Which-Key" },

    -- Lsp Configuration
    -- Mason, Mason-LspConfig, Nvim-LspConfig
    { import = "plugins/LspConfig" },

    -- Linting and Formatting Configuration
    -- None-ls
    { import = "plugins/None-ls" },

    -- Autocompletion and Snippets
    -- LuaSnip, Cmp_LuaSnip, Friendly-Snippets, Cmp-Nvim-Lsp, Nvim-Cmp
    { import = "plugins/Completions" },
    { import = "plugins/Autopairs" },

    -- Debugging
    -- Nvim-Dap-UI, Nvim-Dap, Nvim-Nio
    { import = "plugins/Debugging" },
})
