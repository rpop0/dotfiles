local mason_plugin = {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
}

local mason_lspconfig = {
    'mason-org/mason-lspconfig.nvim',
    -- Ensures the LSPs are installed and also auto-enables all installed LSPs.
    -- Uses the default configuration from nvim-lspconfig if no config is found in after/lsp
    opts = {
        ensure_installed = { 'ruff', 'lua_ls'}
    },
    dependencies = {
        'neovim/nvim-lspconfig'
    },
}

return {
    mason_plugin,
    mason_lspconfig
}
