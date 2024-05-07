return {
    'nvim-pack/nvim-spectre',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function ()
        local wk = require('which-key');

        wk.register({
            ['<leader>s'] = {
                name = '+spectre',
                s = { '<cmd>lua require("spectre").toggle()<CR>', "Toggle spectre" },
                w = { '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Word"}
            }

        })


    end
}
