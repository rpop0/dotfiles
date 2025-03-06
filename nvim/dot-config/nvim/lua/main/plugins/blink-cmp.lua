return {
    {
        'saghen/blink.compat',
        version = '*',
        lazy = true,
        opts = {}

    },
    {
        'saghen/blink.cmp',
        dependencies = {
            'rafamadriz/friendly-snippets',
            'rcarriga/cmp-dap'
        },
        version = '*',
        opts = {
            keymap = {
                preset = 'enter',
                ['<C-CR>'] = { 'accept', 'fallback' },
                ['<CR>'] = {}
            },
            appearance = {
                use_nvim_cmp_as_default = true,
            },
            completion = {
                accept = { auto_brackets = { enabled = true } },
                documentation = {
                    auto_show = true
                }
            },
            -- Enable completions when 
            enabled = function() return vim.bo.buftype ~= 'prompt' or require('cmp_dap').is_dap_buffer() end,

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer'},

                per_filetype = {
                    ['dap-repl'] = {'dap'},
                    org = {'orgmode'}
                },

                providers = {
                    dap = {
                        name = 'dap',
                        module = 'blink.compat.source',
                    },
                    orgmode = {
                        name = 'Orgmode',
                        module = 'orgmode.org.autocompletion.blink',
                        fallbacks = {'buffer'},
                    }
                }
            },
            cmdline = {
                completion = {
                    ghost_text = {enabled = false},
                    menu = {auto_show = true}
                }
            }

        },
        opts_extended = { 'sources.default' }
    }
}
