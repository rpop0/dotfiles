return {
    'tpope/vim-fugitive',
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    'dstein64/nvim-scrollview',
    {
        'numToStr/Comment.nvim',
        opts = {

        },
        lazy = false
    },
    {
       "m4xshen/hardtime.nvim",
       dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
       opts = {}
    },
    'lambdalisue/vim-suda'
}
