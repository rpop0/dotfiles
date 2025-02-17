return {
    'folke/snacks.nvim',
    priroity = 1000,
    lazy = false,
    opts = {
        picker = { enabled = true },
        dashboard = { enabled = true, }
    },
    config = function (_, opts)
        local snacks = require('snacks')
        snacks.setup(opts)
        local wk = require('which-key')
        wk.add({
            {'<leader>f', group='find'},
            {'<leader>ff', function() snacks.picker.smart() end, desc='Find file'},
            {'<leader>fg', function() snacks.picker.grep() end, desc='Grep'},
            {'<leader>fb', function() snacks.picker.buffers() end, desc='Buffers'},
            {'<leader>fh', function() snacks.picker.help() end, desc='Help'},
            {'<leader>fh', function() snacks.picker.help() end, desc='Help'},
            {'<leader>fs', function() snacks.picker.spelling() end, desc='Spelling'},

            --- LSP
            {'<leader>fr', function() snacks.picker.lsp_references() end, desc='LSP References'},
            {'<leader>fd', function() snacks.picker.lsp_definitions() end, desc='LSP Definitions'},
            {'<leader>fi', function() snacks.picker.lsp_implementations() end, desc='LSP Implementations'},
        })

    end
}
