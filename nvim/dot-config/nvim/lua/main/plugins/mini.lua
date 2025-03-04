return {
    'echasnovski/mini.nvim',
    version = false,
    config = function ()
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
                update_n_line = 'gsn'
            }
        })
    end
}
