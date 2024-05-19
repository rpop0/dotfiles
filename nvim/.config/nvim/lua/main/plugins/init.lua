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
    {
       "m4xshen/hardtime.nvim",
       dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
       opts = {
           disable_mouse = false
       }
    },
    'lambdalisue/vim-suda',
    {
        'folke/trouble.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        opts = {}
    }

}
