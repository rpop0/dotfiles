return {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
        'nvim-telescope/telescope.nvim'
    },
    config = function ()
        require('neoclip').setup()
        local wk = require('which-key')

        wk.register({
            ['<leader>f'] = {
                name = '+find',
                c = {'<CMD>Telescope neoclip<CR>', 'Clipboard'}
            }
        })
    end
}
