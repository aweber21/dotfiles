--[[
Lualine
    - A line containing information on the current buffer
--]]

return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            -- Modules
            local lualine = require("lualine")

            -- Setup
            lualine.setup({
                options = {
                    icons_enabled = true,
                    theme = "onedark",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = { "neo-tree" },
                        winbar = { "neo-tree" },
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                        refresh_time = 16, -- ~60fps
                        events = {
                            "WinEnter",
                            "BufEnter",
                            "BufWritePost",
                            "SessionLoadPost",
                            "FileChangedShellPost",
                            "VimResized",
                            "Filetype",
                            "CursorMoved",
                            "CursorMovedI",
                            "ModeChanged",
                        },
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = {}, --"filename"
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                winbar = {
                    lualine_a = { "filename" },
                },
                inactive_winbar = {
                    lualine_a = { "filename" },
                },
                extensions = {},
            })
        end,
    },
}
