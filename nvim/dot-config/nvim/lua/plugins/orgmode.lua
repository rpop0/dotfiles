return {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = {'org'},
    config = function ()
        require('orgmode').setup({
            org_agenda_files = '~/Notes/**/*',
            org_default_notes_file = '~/Notes/refile.org',
            mappings = {
                org = {
                    org_toggle_checkbox = 'cic'
                }
            }
        })
    end
}
