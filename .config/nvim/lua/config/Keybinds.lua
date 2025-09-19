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
end, { desc = "Window Left" })
vim.keymap.set("n", "<C-j>", function()
    vim.cmd(":wincmd j")
end, { desc = "Window Down" })
vim.keymap.set("n", "<C-k>", function()
    vim.cmd(":wincmd k")
end, { desc = "Window Up" })
vim.keymap.set("n", "<C-l>", function()
    vim.cmd(":wincmd l")
end, { desc = "Window Right" })

-- Close buffer
vim.keymap.set("n", "<Leader>q", function()
    vim.cmd(":bdelete")
end, { desc = "Quit Buffer" })

-- Format using textwidth=80 from vimrc on selected lines
vim.keymap.set({ "n", "v" }, "<Leader><C-f>", "gww", { desc = "Format Text Width" })

-- Toggle comment
vim.keymap.set({ "n", "v" }, "<Leader>/", "gcc<Esc>", { remap = true, desc = "Toggle Comment" })
