--[[
Source Vim Settings
--]]
vim.cmd([[
	set runtimepath^=~/.config/vim
	let &packpath = &runtimepath
	source ~/.config/vim/vimrc
]])
