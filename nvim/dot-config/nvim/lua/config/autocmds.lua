vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        local wk = require('which-key')
        wk.add({
            { '<leader>c',  group = 'code' },
            { '<leader>cg', function() vim.lsp.buf.definition() end,             desc = "Go to definition", remap = false, buffer = event.buf },
            { '<leader>ch', function() vim.lsp.buf.hover() end,                  desc = "Hover",          remap = false, buffer = event.buf },
            { '<leader>cf', function() vim.lsp.buf.format({ async = true }) end, desc = "Format",         remap = false, buffer = event.buf },
            { '<leader>cd', function() vim.diagnostic.open_float() end,          desc = "Diagostic",      remap = false, buffer = event.buf },
            { '<leader>cr', function() vim.lsp.buf.rename() end,                 desc = "Rename",         remap = false, buffer = event.buf },
            { '<leader>ca', function() vim.lsp.buf.code_action() end,            desc = "Code actions",   remap = false, buffer = event.buf }
        })
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
            { buffer = event.buf, remap = false, desc = "Next diagnostic" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
            { buffer = event.buf, remap = false, desc = "Previous diagnostic" })

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method('textDocument/foldingRange') then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
    end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
    pattern = '*',
    callback = function()
        if vim.bo.filetype ~= '' and vim.bo.buftype == '' then
            vim.cmd('silent! mkview')
        end
    end
})

vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = '*',
    callback = function ()
        if vim.bo.filetype ~= '' and vim.bo.buftype == '' then
            vim.cmd('silent! loadview')
        end
    end
})

