--[[
Nvim-Dap-UI
    - GUI interface for Nvim-Dap
Nvim-Dap
    - Neovim debugger adapter protocol tool
--]]

return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",

            -- Languages
            -- ~language~ dap
        },
        config = function()
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
        end,
    },
    {},
}
