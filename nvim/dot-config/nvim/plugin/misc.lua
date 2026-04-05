
vim.api.nvim_create_autocmd('InsertEnter', {
    once = true,
    callback = function()
        vim.pack.add({
            'https://github.com/windwp/nvim-autopairs',
            'https://github.com/kawre/neotab.nvim'
        })
        require('nvim-autopairs').setup()
        require('neotab').setup({})
    end
})

vim.pack.add({
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
    'https://github.com/dstein64/nvim-scrollview',
    'https://github.com/smoka7/hop.nvim'
})
require('render-markdown').setup()
require('hop').setup()
require('scrollview.contrib.gitsigns').setup()

vim.keymap.set("n", "gw", function() require('hop').hint_words()  end)
