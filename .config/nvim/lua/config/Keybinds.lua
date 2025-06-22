--[[
Keybinds
    - Global keybinds for Neovim
--]]

-- Leader as <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window Navigation
vim.keymap.set("n", "<C-h>", function()
    vim.cmd(":wincmd h")
end, {})
vim.keymap.set("n", "<C-j>", function()
    vim.cmd(":wincmd j")
end, {})
vim.keymap.set("n", "<C-k>", function()
    vim.cmd(":wincmd k")
end, {})
vim.keymap.set("n", "<C-l>", function()
    vim.cmd(":wincmd l")
end, {})

-- Close buffer
vim.keymap.set("n", "<Leader>q", function()
    vim.cmd(":bdelete")
end, {})

-- Format using textwidth=80 from vimrc on selected lines
vim.keymap.set({ "n", "v" }, "<Leader><C-f>", "gww", {})
