return {
    'vimwiki/vimwiki',
    event = 'BufEnter *.wiki',
    keys = { '<leader>ww', '<leader>wt', '<leader>wi'},
    init = function ()
        vim.g.vimwiki_list = {
            {
                path = '~/vimwiki/',
                syntax = 'default',
                ext = 'wiki',
            },
        }
    end
}
