
local lsp_zero_plugin = {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false
}

local mason_plugin = {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
}


local lsp_config = {
    'neovim/nvim-lspconfig',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'williamboman/mason-lspconfig.nvim'
    }
}
local setup_pylsp = function ()
    require('lspconfig').pylsp.setup{
        settings = {
            pylsp = {
                plugins = {
                    pylint = {enabled = false},
                    pyflakes = {enabled = false},
                    pycodestyle = {enabled = false},
                    autopep8 = {enabled = false},
                    mccabe = {enabled = false},
                    yapf = {enabled = false},
                    flake8 = {enabled = false},
                    pydocstyle = {enabled = false},
                    jedi_completion = { fuzzy = true }

                }
            }
        }
    }
end

lsp_config.config = function ()
    local lsp_zero = require('lsp-zero')
    local wk = require('which-key')

    lsp_zero.on_attach(function(client, bufnr)
        require('lsp_signature').on_attach({}, bufnr);

        wk.register({
            ["<leader>c"] = {
                name = "+code",
                g = { function() vim.lsp.buf.definition() end, "Go to definition", remap = false, buffer = bufnr },
                h = { function() vim.lsp.buf.hover() end, "Hover", remap = false, buffer = bufnr },
                f = { function() vim.lsp.buf.format { async = true } end, "Format", remap = false, buffer = bufnr },
                d = { function() vim.diagnostic.open_float() end, "Diagostic", remap = false, buffer = bufnr },
                r = { function() vim.lsp.buf.rename() end, "Rename", remap = false, buffer = bufnr },
                a = { function() vim.lsp.buf.code_action() end, "Code actions", remap = false, buffer = bufnr}

            }
        })
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { buffer = bufnr, remap = false, desc = "Next diagnostic"})
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, remap = false, desc = "Previous diagnostic"})

    end)

    require('mason-lspconfig').setup({
        -- Use :PylspInstall for mypy
        ensure_installed = {'pylsp', 'ruff_lsp', 'tsserver', 'cssls', 'html'},
        handlers = {
            lsp_zero.default_setup,
            pylsp = setup_pylsp,
            lua_ls = function ()
                local lua_opts = lsp_zero.nvim_lua_ls()
                require('lspconfig').lua_ls.setup(lua_opts)
            end

        }
    })
end




return {
    lsp_zero_plugin,
    mason_plugin,
    lsp_config
}
