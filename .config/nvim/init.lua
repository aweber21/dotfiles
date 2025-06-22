--[[
Colorschemes
--]]
require("colorschemes")

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
require("keybinds")

--[[
Plugins
--]]
require("plugins")
