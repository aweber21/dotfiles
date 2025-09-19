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
Neovim Overrides
--]]
vim.o.showmode = false

--[[
Keybinds
--]]
require("config/Keybinds")

--[[
Colorscheme
    - Set global variable here and actually set colorscheme in specific
      colorscheme lua file
    - Must be set before Lazy executes
--]]
vim.g.colors_name = "vscode"

--[[
Lazy
--]]
require("config/Lazy")
