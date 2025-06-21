--[[
Keybinds
    - Global keybinds for Neovim
--]]

-- Leader as <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Format using textwidth=80 from vimrc on lines highlighted
vim.keymap.set({ 'n', 'v' }, '<Leader><C-f>', 'gww', {})
