return {
    'tpope/vim-fugitive',
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        'ggandor/leap.nvim',
        dependencies = {
            'tpope/vim-repeat'
        },
        config = function ()
            local leap = require('leap');
            leap.create_default_mappings();
            leap.opts.safe_labels = {}
        end
    },
    'dstein64/nvim-scrollview'
}
