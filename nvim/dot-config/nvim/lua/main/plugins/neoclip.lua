return {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
        'nvim-telescope/telescope.nvim'
    },
    config = function ()
        require('neoclip').setup()
        local wk = require('which-key')

        wk.add({
            {'<leader>fc', '<CMD>Telescope neoclip<CR>', desc='Clipboard'}
        })
    end
}
