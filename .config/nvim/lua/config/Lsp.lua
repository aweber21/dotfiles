--[[
Lsp
    - Configuration of Lsps in Neovim
--]]

-- Capabilities
vim.lsp.config('*', {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
})

-- Diagnostics
vim.o.signcolumn = 'yes'
vim.diagnostic.config({
    underline = true,
    virtual_text = true,
    virtual_lines = false,
    -- virtual_lines = {
    --     current_line = true
    -- },
    signs = true,
    update_in_insert = true,
    severity_sort = true,
})

-- Lsp Attach Autocommand
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'Configure Lsp on attach',
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        -- Code Actions
        if client:supports_method('textDocument/codeAction') then
            vim.keymap.set('n', '<Leader>ca', function()
                vim.lsp.buf.code_action()
                vim.api.nvim_input('<Space><Esc>')
            end, { desc = 'Code Actions' })
        end

        -- Completion (Handled by Blink.cmp)
        -- if client:supports_method('textDocument/completion') then
        --     vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy',
        --         'popup' }
        --     vim.lsp.completion.enable(true, client.id, ev.buf,
        --         { autotrigger = true })
        --
        --     -- Manually open completion
        --     vim.keymap.set('i', '<C-c>', vim.lsp.completion.get,
        --         { desc = 'Manually open completion' })
        --
        --     -- Insert completion selection
        --     vim.keymap.set('i', '<Tab>', function()
        --         if vim.fn.pumvisible() == 1 then
        --             return '<C-y>'
        --         else
        --             return '<Tab>'
        --         end
        --     end, { expr = true, silent = true })
        -- end

        -- Declaration
        if client:supports_method('textDocument/declaration') then
            vim.keymap.set('n', '<Leader>cD', vim.lsp.buf.declaration,
                { desc = 'Go to declaration' })
        end

        -- Definition
        if client:supports_method('textDocument/definition') then
            vim.keymap.set('n', '<Leader>cd', vim.lsp.buf.definition,
                { desc = 'Go to definition' })
        end

        -- Diagnostic
        if client:supports_method('textDocument/publishDiagnostics')
            or client:supports_method('textDocument/diagnostic') then
            vim.keymap.set('n', '<Leader>cg', vim.diagnostic.open_float,
                { desc = 'Open floating diagnostics' })
        end

        -- Formatting
        if client:supports_method('textDocument/formatting') then
            vim.keymap.set('n', '<Leader>cf', vim.lsp.buf.format,
                { desc = 'Format' })
        end

        -- Hover
        if client:supports_method('textDocument/hover') then
            vim.keymap.set('n', '<Leader>ch', vim.lsp.buf.hover,
                { desc = 'Display hover information' })
        end

        -- References
        if client:supports_method('textDocument/references') then
            vim.keymap.set('n', '<Leader>cr', vim.lsp.buf.references,
                { desc = 'Show references' })
        end

        -- Rename
        if client:supports_method('textDocument/rename') then
            vim.keymap.set('n', '<Leader>cR', vim.lsp.buf.rename,
                { desc = 'Rename' })
        end
    end,
})
