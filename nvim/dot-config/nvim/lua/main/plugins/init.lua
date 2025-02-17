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
    'lambdalisue/vim-suda',
    {
        'folke/trouble.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function ()
            require('trouble').setup{}
            local wk = require('which-key')
            wk.add({
                {'<leader>x', group='trouble'},
                {'<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc="Project diagnostics"},
                {'<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc="Buffer diagnostics"},
            })
        end
    },
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        config = function ()
            local hardtime = require('hardtime')
            hardtime.setup{
                disable_mouse = false
            }
            local hardtime_config = require('hardtime.config')
            table.insert(hardtime_config.config.disabled_filetypes, 'harpoon')
        end,
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'}
    },
    {
        'sphamba/smear-cursor.nvim',
        opts = {
            hide_target_hack = false,
            smear_isnert_mode = true,
            vertical_bar_cursor_insert_mode = true,
        },
    },
}
