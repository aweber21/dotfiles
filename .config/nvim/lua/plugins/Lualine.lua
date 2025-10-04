--[[
Lualine
    - A status line containing information on the current buffer
--]]

return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            -- Modules
            local lualine = require('lualine')

            -- Setup
            lualine.setup({
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = { 'neo-tree' },
                        winbar = {
                            'neo-tree', 'dapui_watches', 'dapui_stacks',
                            'dapui_breakpoints', 'dapui_scopes', 'dapui_console',
                            'dap-repl', 'dapui_stacks',
                        },
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = true,
                    globalstatus = false,
                    refresh = {
                        tabline = 1000,
                        winbar = 1000,
                        statusline = 1000,
                        refresh_time = 16, -- ~60fps
                        events = {
                            'WinEnter',
                            'BufEnter',
                            'BufWritePost',
                            'SessionLoadPost',
                            'FileChangedShellPost',
                            'VimResized',
                            'Filetype',
                            'CursorMoved',
                            'CursorMovedI',
                            'ModeChanged',
                        },
                    },
                },
                tabline = {},
                winbar = {
                    lualine_a = { 'filename' },
                },
                inactive_winbar = {
                    lualine_a = { 'filename' },
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = {},
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { 'filetype', 'location' },
                },
                extensions = {},
            })

            -- Colorscheme Overrides
            -- VSCode
            -- if vim.g.colors_name == "vscode" then
            -- local vscode_colors = require("vscode/colors").get_colors()
            -- lualine.setup({
            --     options = {
            --         theme = {
            --             normal = {
            --                 a = { fg = "#ffffff", bg = vscode_colors.vscBlue, gui = "bold" },
            --             },
            --             insert = {
            --                 a = { fg = "#ffffff", bg = vscode_colors.vscGreen, gui = "bold" },
            --             },
            --             visual = {
            --                 a = { fg = "#ffffff", bg = vscode_colors.vscViolet, gui = "bold" },
            --             },
            --             command = {
            --                 a = { fg = vscode_colors.vscFront, bg = vscode_colors.vscOrange, gui = "bold" },
            --             },
            --             replace = {
            --                 a = { fg = "#ffffff", bg = vscode_colors.vscRed, gui = "bold" },
            --             },
            --             inactive = {
            --                 a = { fg = vscode_colors.vscFront, bg = vscode_colors.vscGray },
            --             },
            --         },
            --     },
            -- })
            -- end
        end,
    },
}
