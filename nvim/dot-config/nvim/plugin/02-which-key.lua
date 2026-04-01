vim.pack.add({'https://github.com/folke/which-key.nvim'})


local wk = require('which-key')

wk.add({
    { "<leader>?", function () wk.show({ global = false }) end}
})


