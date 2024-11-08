return {
    'echasnovski/mini.nvim',
    version = false,
    config = function ()
        require('mini.cursorword').setup()
        require('mini.ai').setup()
        require('mini.comment').setup()
        require('mini.indentscope').setup()
        require('mini.notify').setup()
    end
}
