
vim.api.nvim_create_autocmd('InsertEnter', {
    once = true,
    callback = function()
        vim.pack.add({
            'https://github.com/windwp/nvim-autopairs',
            'https://github.com/kawre/neotab.nvim'
        })
        require('nvim-autopairs').setup()
        require('neotab').setup()
    end
})

vim.pack.add({
    'https://github.com/folke/flash.nvim',
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    'https://github.com/dstein64/nvim-scrollview'
})
require('flash').setup()
require('render-markdown').setup()
require('scrollview.contrib.gitsigns').setup()

local wk = require('which-key')

wk.add({
    { 's', mode = {'n', 'x', 'o'}, function() require('flash').jump() end, desc = 'Flash'},
    { 'S', mode = {'n', 'x', 'o'}, function() require('flash').treesitter() end, desc = 'Flash treesitter'},
})
