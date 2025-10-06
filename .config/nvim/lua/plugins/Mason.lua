--[[
Mason
    - Installer for Lsps, Formatters, Linters, and Debuggers
Mason-LspConfig
    - Ensures that Lsps are installed and enabled
Nvim-LspConfig
    - Contains default Lsp configurations
Mason-Null-ls
    - Ensures that Formatters and Linters are installed and set up with None-ls
None-ls
    - Wraps Formatters and Linters in a generalized Lsp so they can be used by
      Neovim
Mason-Nvim-Dap
    - Ensures that Debuggers are installed and set up with Nvim-Dap
Nvim-Dap
    - Neovim debugger adapter protocol tool
--]]

return {
    {
        'mason-org/mason.nvim',
        config = function()
            -- Modules
            local mason = require('mason')

            -- Setup
            mason.setup({})
        end,
    },
    {
        'mason-org/mason-lspconfig.nvim',
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        config = function()
            -- Modules
            local mason_lspconfig = require('mason-lspconfig')

            -- Setup
            mason_lspconfig.setup({
                ensure_installed = {
                    -- Lua
                    'lua_ls', -- lua-language-server

                    -- Python
                    'basedpyright',
                    'ruff',
                },
                automatic_enable = true,
            })
        end,
    },
    {
        'jay-babu/mason-null-ls.nvim',
        dependencies = {
            'mason-org/mason.nvim',
            'nvimtools/none-ls.nvim',
            'nvimtools/none-ls-extras.nvim',
        },
        config = function()
            -- Modules
            local mason_null_ls = require('mason-null-ls')

            -- Setup
            mason_null_ls.setup({
                ensure_installed = {
                    -- Python
                    -- 'ruff'
                },
                -- Automatic Enable
                handlers = {},
                -- Install Mason tools found in None-ls
                automatic_installation = false,
                methods = {
                    diagnostics = true,
                    formatting = true,
                    code_actions = true,
                    completion = true,
                    hover = true,
                },
            })
        end,
    },
    {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = {
            'mason-org/mason.nvim',
            'mfussenegger/nvim-dap',
            'rcarriga/nvim-dap-ui',
            'nvim-neotest/nvim-nio',
            'theHamsta/nvim-dap-virtual-text',
        },
        config = function()
            -- Modules
            local mason_nvim_dap = require('mason-nvim-dap')
            local dap = require('dap')
            local dapui = require('dapui')
            local dap_virtual_text = require('nvim-dap-virtual-text')

            -- Setup
            mason_nvim_dap.setup({
                ensure_installed = {
                    -- Python
                    'debugpy',
                },
                -- Automatic Enable
                handlers = {},
                -- Install Mason tools found in Nvim-Dap
                automatic_installation = false,
            })
            dapui.setup({})
            dap_virtual_text.setup({})

            -- Listeners
            dap.listeners.after.event_initialized.dapui_config = function()
                dapui.open()
            end

            -- Keybinds
            vim.keymap.set('n', '<Leader>dd', dapui.toggle,
                { desc = 'Toggle DAP UI' })
            vim.keymap.set('n', '<Leader>dc', dap.continue,
                { desc = 'Continue/Start' })
            vim.keymap.set('n', '<Leader>dp', dap.pause, { desc = 'Pause' })
            vim.keymap.set('n', '<Leader>dq', dap.terminate,
                { desc = 'Quit' })
            vim.keymap.set('n', '<Leader>dr', dap.restart, { desc = 'Restart' })
            vim.keymap.set('n', '<Leader>dR', dap.run_last, { desc = 'Rerun' })
            vim.keymap.set('n', '<Leader>do', dap.step_over,
                { desc = 'Step Over' })
            vim.keymap.set('n', '<Leader>di', dap.step_into,
                { desc = 'Step Into' })
            vim.keymap.set('n', '<Leader>dO', dap.step_out,
                { desc = 'Step Out' })
            vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint,
                { desc = 'Toggle Breakpoint' })
            vim.keymap.set('n', '<Leader>dB', dap.clear_breakpoints,
                { desc = 'Clear Breakpoints' })
        end,
    },
}
