return {
    'christoomey/vim-tmux-navigator',
    config = function ()
        vim.keymap.set('n', '<c-h>', '<cmd>TmuxNavigateLeft<cr>')
        vim.keymap.set('n', '<c-j>', '<cmd>TmuxNavigateDown<cr>')
        vim.keymap.set('n', '<c-k>', '<cmd>TmuxNavigateUp<cr>')
        vim.keymap.set('n', '<c-l>', '<cmd>TmuxNavigateRight<cr>')
        vim.keymap.set('n', '<c-\\>', '<cmd>TmuxNavigatePrevious<cr>')
    end
}
