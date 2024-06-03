local telescope = {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',

    dependencies = {
        'nvim-lua/plenary.nvim',
    },

    config = function()
        local builtin = require('telescope.builtin')
        local wk = require("which-key")

        wk.register({
            ["<leader>f"] = {
                name = "+find",
                f = {builtin.find_files, "Find file"},
                g = {builtin.live_grep, "Live grep"},
                b = {builtin.buffers, "Search buffers"},
                h = {builtin.help_tags, "Search help"},
                r = {builtin.lsp_references, "Code references"},
                d = {builtin.lsp_definitions, "Code definitions"},
                i = {builtin.lsp_implementations, "Code implementations"}
            },
        })

        vim.keymap.set('n', '<leader>pv', ':Telescope file_browser path=%:p:h select_buffer=true<CR>')
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
