vim.pack.add({
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason-lspconfig.nvim'
    -- Ensures the LSPs are installed and also auto-enables all installed LSPs.
    -- Uses the default configuration from nvim-lspconfig if no config is found in after/lsp
})

require('mason').setup()
require('mason-lspconfig').setup({
        ensure_installed = { 'ruff', 'lua_ls' }
    }
)
