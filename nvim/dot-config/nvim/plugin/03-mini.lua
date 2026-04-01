vim.pack.add({'https://github.com/nvim-mini/mini.nvim'})

require('mini.cursorword').setup()
require('mini.ai').setup()
require('mini.comment').setup()
require('mini.indentscope').setup()
require('mini.notify').setup()
require('mini.surround').setup({
    mappings = {
        add = 'gsa',
        delete = 'gsd',
        find = 'gsf',
        find_left = 'gsF',
        highlight = 'gsh',
        replace = 'gsr',
        update_n_lines = 'gsn'
    }
})
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()
