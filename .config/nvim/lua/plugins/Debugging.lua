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
            vim.keymap.set("n", "<Leader>dr", dap.run, { desc = "Run" })
            vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "Rerun" })
            vim.keymap.set("n", "<Leader>dR", dap.restart, { desc = "Restart" })
            vim.keymap.set("n", "<Leader>dt", dap.terminate, { desc = "Terminate" })
            vim.keymap.set("n", "<Leader>dp", dap.pause, { desc = "Pause" })
            vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue" })
            vim.keymap.set("n", "<Leader>dso", dap.step_over, { desc = "Step Over" })
            vim.keymap.set("n", "<Leader>dsi", dap.step_into, { desc = "Step Into" })
            vim.keymap.set("n", "<Leader>dsO", dap.step_out, { desc = "Step Out" })
            vim.keymap.set("n", "<Leader>dbl", dap.list_breakpoints, { desc = "List" })
            vim.keymap.set("n", "<Leader>dbc", dap.clear_breakpoints, { desc = "Clear" })
            vim.keymap.set("n", "<Leader>dbt", dap.toggle_breakpoint, { desc = "Toggle" })
        end,
    },
}
