return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equivalent to setup({}) function
    },
    {
        'dstein64/nvim-scrollview',
        dependencies = {
            'lewis6991/gitsigns.nvim'
        },
        config = function ()
            require('scrollview.contrib.gitsigns').setup()
        end
    },
    {
        'numToStr/Comment.nvim',
        opts = {

        },
        lazy = false
    },
    'lambdalisue/vim-suda',
    {
        'folke/trouble.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        opts = {}
    }

}
