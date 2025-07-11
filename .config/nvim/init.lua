--[[
Init.lua
    - Main file for Neovim configuration
--]]

--[[
Source Vim Settings
--]]
vim.cmd([[
    set runtimepath^=~/.config/vim
    let &packpath = &runtimepath
    source ~/.config/vim/vimrc
]])

--[[
Keybinds
--]]
require("config/Keybinds")

--[[
Lazy
--]]
require("config/Lazy")
