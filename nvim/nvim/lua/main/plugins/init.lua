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
        'ray-x/lsp_signature.nvim',
        event = "VeryLazy",
        opts = {},
    },
    {
        'goolord/alpha-nvim',
        config = function()
            require'alpha'.setup(require'alpha.themes.theta'.config)
        end
    }
}
