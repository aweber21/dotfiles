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
Options
--]]
require('config/Options')

--[[
Autocommands
--]]
require('config/Autocommands')

--[[
Keybinds
--]]
require('config/Keybinds')

--[[
Colorscheme
    - Set global variable here and actually set colorscheme in specific
      colorscheme lua file
    - Must be set before Lazy executes
--]]
vim.g.colors_name = 'vscode'

--[[
Lazy
--]]
require('config/Lazy')

--[[
Lsp
    - Configure Lsps after Lazy executes so Mason can install if needed
--]]
require('config/Lsp')
