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
            vim.keymap.set("n", "<Leader>dr", dap.run, {})
            vim.keymap.set("n", "<Leader>dl", dap.run_last, {})
            vim.keymap.set("n", "<Leader>dR", dap.restart, {})
            vim.keymap.set("n", "<Leader>dt", dap.terminate, {})
            vim.keymap.set("n", "<Leader>dp", dap.pause, {})
            vim.keymap.set("n", "<Leader>dc", dap.continue, {})
            vim.keymap.set("n", "<Leader>dso", dap.step_over, {})
            vim.keymap.set("n", "<Leader>dsi", dap.step_into, {})
            vim.keymap.set("n", "<Leader>dsO", dap.step_out, {})
            vim.keymap.set("n", "<Leader>dbl", dap.list_breakpoints, {})
            vim.keymap.set("n", "<Leader>dbc", dap.clear_breakpoints, {})
            vim.keymap.set("n", "<Leader>dbt", dap.toggle_breakpoint, {})
        end,
    },
}
