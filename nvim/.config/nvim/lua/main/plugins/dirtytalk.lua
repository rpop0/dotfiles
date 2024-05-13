return {
    'psliwka/vim-dirtytalk',
    build =':DirtytalkUpdate',
    config = function ()
        vim.opt.spelllang = {'en_us', 'programming'}
    end
}
