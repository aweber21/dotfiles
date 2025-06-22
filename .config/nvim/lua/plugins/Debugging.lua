--[[
Nvim-Dap
    - Neovim debugger adapter protocol tool
    > pack/plugins/start/nvim-dap
Nvim-Dap-UI
    > pack/plugins/start/nvim-dap-ui

Dependencies:
Nvim-Nio
    > pack/plugins/start/nvim-nio
--]]

-- Modules
local dap = require("dap")
local dapui = require("dapui")
-- local ~language~  = require("~language~")

-- Setup
dapui.setup({})
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

-- Languages
-- ~language~.setup({})

-- Keybinds
vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<Leader>dc", dap.continue, {})
