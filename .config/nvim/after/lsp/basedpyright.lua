--[[
Basedpyright
    - Lsp for Python
--]]
return {
    settings = {
        basedpyright = {
            -- Disable to use Ruff
            disableOrganizedImports = true,
            disableTaggedHints = true,
            analysis = {
                typeCheckingMode = 'standard',
            },
        },
    },
}
