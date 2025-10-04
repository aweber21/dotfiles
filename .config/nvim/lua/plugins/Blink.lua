--[[
Blink
    - A plugin that facilitates completion and snippets
--]]

return {
    {
        'saghen/blink.cmp',
        tag = 'v1.7.0',
        dependencies = {
            'rafamadriz/friendly-snippets',
        },
        config = function()
            -- Modules
            local blink = require('blink.cmp')

            -- Setup
            blink.setup({
                completion = {
                    keyword = {
                        range = 'full',
                    },
                    accept = {
                        auto_brackets = {
                            enabled = false,
                        },
                    },
                    list = {
                        selection = {
                            preselect = false,
                            auto_insert = true,
                        },
                    },
                    menu = {
                        auto_show = true,
                    },
                    documentation = {
                        auto_show = true,
                        auto_show_delay_ms = 1000,
                    },
                    ghost_text = {
                        enabled = true,
                    },
                },
                keymap = {
                    preset = 'default',
                    ['<C-c>'] = { 'show' },
                    ['<Tab>'] = { 'select_and_accept', 'fallback' },
                    ['<Enter>'] = { 'select_and_accept', 'fallback' },
                    ['<Esc>'] = { 'cancel', 'fallback' },
                },
                appearance = {
                    nerd_font_variant = 'mono',
                },
                sources = {
                    default = { 'lsp', 'path', 'snippets', 'buffer' },
                },
                signature = {
                    enabled = true,
                },
                fuzzy = {
                    implementation = 'prefer_rust_with_warning',
                },
            })

            -- Capabilities
            vim.lsp.config('*', {
                capabilities = blink.get_lsp_capabilities(),
            })
        end,
    },
}
