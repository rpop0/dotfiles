vim.pack.add({'https://github.com/chrisgrieser/nvim-origami'})

require('origami').setup({
    foldKeymaps = {
        setup = false
    },
    autoFold = {
        enabled = false
    }

})
-- recommended: disable vim's auto-folding
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
