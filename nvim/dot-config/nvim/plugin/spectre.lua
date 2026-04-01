vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-pack/nvim-spectre'
})
local wk = require('which-key');

wk.add({
    {'<leader>s', group='spectre'},
    {'<leader>ss', '<cmd>lua require("spectre").toggle()<CR>', desc='Toggle spectre'},
    {'<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc='Word'}
})
