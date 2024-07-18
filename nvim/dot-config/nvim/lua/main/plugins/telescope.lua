local telescope = {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',

    dependencies = {
        'nvim-lua/plenary.nvim',
    },

    config = function()
        local builtin = require('telescope.builtin')
        local wk = require("which-key")

        wk.add({
            {'<leader>f', group='find'},
            {'<leader>ff', builtin.find_files, desc='Find file'},
            {'<leader>fg', builtin.live_grep, desc='Live grep'},
            {'<leader>fb', builtin.buffers, desc='Search buffers'},
            {'<leader>fh', builtin.help_tags, desc='Search help'},
            {'<leader>fr', builtin.lsp_references, desc='Code references'},
            {'<leader>fd', builtin.lsp_definitions, desc='Code definitions'},
            {'<leader>fi', builtin.lsp_implementations, desc='Code implementations'}
        })

        vim.keymap.set('n', 'z=', '<cmd>Telescope spell_suggest<CR>', {desc = 'Spelling suggestions'})

        require('telescope').setup {
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    "venv"
                }
            }
        }

        require('telescope').load_extension "file_browser"
    end
}

local telescope_file_browser = {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
}

return {telescope, telescope_file_browser}
