vim.pack.add({
    { src = 'https://github.com/saghen/blink.cmp', version = 'v1.10.1'},
    'https://github.com/mayromr/blink-cmp-dap'
})

require('blink.cmp').setup({
    keymap = {
        preset = 'enter',
        ['<C-CR>'] = { 'accept', 'fallback' },
        ['<CR>'] = {}
    },

    sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer'},

        per_filetype = {
            ['dap-repl'] = {'dap'},
        },

        providers = {
            dap = {
                name = 'dap',
                module = 'blink-cmp-dap',
            },
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                -- make lazydev completions top priority (see `:h blink.cmp`)
                score_offset = 100,
            },
            lsp = { fallbacks = {} }
        }
    },
    completion = {
        accept = { auto_brackets = { enabled = true } },
        documentation = {
            auto_show = true
        }
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },

    cmdline = {
        completion = {
            ghost_text = {enabled = false},
            menu = {auto_show = true}
        }
    },
    signature = {
        enabled = true
    }

})
