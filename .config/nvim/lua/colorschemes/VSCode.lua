--[[
VSCode
    - Default VSCode colorscheme
--]]

return {
    "Mofiqul/vscode.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins
    config = function()
        -- Modules
        local vscode = require("vscode")
        local vscode_colors = require("vscode/colors").get_colors()

        -- Setup
        vscode.setup({
            style = "dark",
            transparent = true,
            italic_comments = true,
            italic_inlayhints = true,
            underline_links = true,
            disable_nvimtree_bg = false,
            terminal_colors = true,
            color_overrides = {},
            group_overrides = {
                NeoTreeIndentMarker = {
                    fg = vscode_colors.vscFront,
                    bg = vscode_colors.vscNone,
                },
                ModeMsg = {
                    fg = vscode_colors.vscFront,
                    bg = vscode_colors.vscNone,
                },
                MoreMsg = {
                    fg = vscode_colors.vscFront,
                    bg = vscode_colors.vscNone,
                },
            },
        })

        if vim.g.colors_name == "vscode" then
            -- Load
            vscode.load()

            -- Set colorscheme (redundant of load)
            vim.cmd.colorscheme("vscode")
        end
    end,
}
