vim.pack.add({ 'https://github.com/folke/snacks.nvim' })

local snacks = require('snacks')

snacks.setup({
    scroll = { enabled = true, animate = { duration = { step = 10, total = 150 }, easing = 'linear' } },
    picker = { enabled = true },
    dashboard = {
        enabled = true,
        preset = {
            keys = {
                  { icon = " ", key = "ff", desc = "Find File", action = ":lua require('fff').find_files()" },
                  { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                  { icon = " ", key = "fg", desc = "Find Text", action = ":lua require('fff').live_grep()" },
                  { icon = " ", key = "c", desc = "Config", action = ":lua vim.fn.chdir(vim.fn.stdpath('config')); require('fff').find_files()" },
                  { icon = " ", key = "u", desc = "Update Plugins", action = ":lua vim.pack.update()" },
                  { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
        },
        sections = {
            {
                section = 'header'
            },
            {
                section = 'keys',
                gap = 1,
                padding = 1,
            }
        }
    }
})

local wk = require('which-key')
wk.add({
    {'<leader>f', group='find'},
    {'<leader>fb', function() snacks.picker.buffers() end, desc='Buffers'},
    {'<leader>fh', function() snacks.picker.help() end, desc='Help'},
    {'<leader>fs', function() snacks.picker.spelling() end, desc='Spelling'},

    --- LSP
    {'<leader>fr', function() snacks.picker.lsp_references() end, desc='LSP References'},
    {'<leader>fd', function() snacks.picker.lsp_definitions() end, desc='LSP Definitions'},
    {'<leader>fi', function() snacks.picker.lsp_implementations() end, desc='LSP Implementations'},
})
