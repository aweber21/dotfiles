--[[
Lua-ls
    - Lsp for Lua
--]]

return {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            codeLens = {
                enable = true,
            },
            completion = {
                enable = true,
                callSnippet = 'Both',
                requireSeparator = '/',
            },
            diagnostics = {
                enable = true,
                globals = { 'vim' },
            },
            format = {
                enable = true,
                defaultConfig = {
                    -- Basic
                    indent_style = 'space',
                    indent_size = '4',
                    quote_style = 'single',
                    max_line_length = '80',
                    trailing_table_separator = 'smart',
                    insert_final_newline = 'false',

                    -- Whitespace
                    space_inside_function_call_parentheses = 'false',
                    space_inside_function_param_list_parentheses = 'false',
                    space_inside_square_brackets = 'false',
                    space_around_table_append_operator = 'false',
                    ignore_spaces_inside_function_call = 'false',

                    -- Alignment
                    align_continuous_assign_statement = 'false',
                    align_continuous_rect_table_field = 'false',
                    align_array_table = 'false',

                    -- Other Indentation
                    never_indent_before_if_condition = 'false',
                    never_indent_comment_on_if_branch = 'true',

                    -- Preferences
                    ignore_space_after_colon = 'false',
                    remove_call_expression_list_finish_comma = 'false',
                    end_statement_with_semicolon = 'same_line',
                },
            },
            hint = {
                enable = true,
            },
            hover = {
                enable = true,
            },
            semantic = {
                enable = true,
            },
            spell = {
                -- dict = {},
            },
            workspace = {
                library = {
                    vim.api.nvim_get_runtime_file('', true),
                    vim.env.VIMRUNTIME,
                    vim.fn.expand('$VIMRUNTIME/lua'),
                    vim.fn.expand('$VIMRUNTIME/lua/vim/lsp'),
                    '${3rd}/luv/library',
                },
            },
        },
    },
}
