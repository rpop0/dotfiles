return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',

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

            }
        })

        require('telescope').setup {
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    "venv"
                }
            }
        }
    end
}
