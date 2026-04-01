vim.pack.add({'https://github.com/sindrets/diffview.nvim'})

local wk = require('which-key')

wk.add({
    "<leader>gd",
    function()
        if next(require('diffview.lib').views) == nil then
            vim.cmd('DiffviewOpen')
        else
            vim.cmd('DiffviewClose')
        end
    end,
    desc = "Toggle Diffview"
})
