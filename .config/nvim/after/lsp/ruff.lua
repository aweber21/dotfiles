--[[
Ruff
    - Lsp for Python
    - Primarily used for formatting and linting
--]]
return {
    init_options = {
        settings = {
            lineLength = 80,
            configuration = {
                format = {
                    ['quote-style'] = 'single',
                },
                lint = {
                    ['flake8-quotes'] = {
                        ['inline-quotes'] = 'single',
                    },
                },
            },
        },
    },
}
