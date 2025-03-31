local debug_plugins = {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio',
        'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')
        local wk = require('which-key')
        require('nvim-dap-virtual-text').setup {
            virt_text_pos = 'eol',
            commented = true
        }

        dapui.setup({
            controls = {
                element = "scopes"
            },
            layouts = {
                {
                    elements = {
                        {
                            id = 'scopes',
                            size = 1
                        },
                    },
                    position = "bottom",
                    size = 10
                },
                {
                    elements = {
                        {
                            id = 'console',
                            size = 1
                        }
                    },
                    position = "right",
                    size = 80
                }
            }

        })

        -- DAP UI config
        dap.listeners.after.event_initialized.dapui_config = function()
            dapui.open()
        end

        vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})

        vim.keymap.set('n', '<F1>', ':DapStepIn<CR>')
        vim.keymap.set('n', '<F2>', ':DapStepOver<CR>')
        vim.keymap.set('n', '<F3>', ':DapStepOut<CR>')
        vim.keymap.set('n', '<F4>', function () dapui.float_element('repl') end)


        wk.add({
            {'<leader>d', group='debug'},
                {'<leader>db', function() dap.toggle_breakpoint() end, desc='Breakpoint'},
                {'<leader>dc', function() dap.continue({}) end, desc='Continue'},
                {'<leader>dt', function() dap.terminate() end, desc='Terminate'},
                {'<leader>du', function() dapui.toggle() end, desc='Toggle UI'},
                {'<leader>dr', function() dapui.float_element('repl') end, desc='Toggle REPL'}
        })
    end
}

local new_debug_plugins = {
    'mfussenegger/nvim-dap',
    dependencies = {
        {'igorlfs/nvim-dap-view', opts={}},
        'nvim-neotest/nvim-nio',
        'theHamsta/nvim-dap-virtual-text',
    },
    config = function ()
        local dap = require('dap')
        local dv = require('dap-view')
        local wk = require('which-key')
        require('nvim-dap-virtual-text').setup {
            virt_text_pos = 'eol',
            commented = true
        }


        dap.listeners.before.attach['dap-view-config'] = function()
            dv.open()
        end
        dap.listeners.before.launch['dap-view-config'] = function()
            dv.open()
        end

        vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})

        vim.keymap.set('n', '<F1>', ':DapStepIn<CR>')
        vim.keymap.set('n', '<F2>', ':DapStepOver<CR>')
        vim.keymap.set('n', '<F3>', ':DapStepOut<CR>')
        -- vim.keymap.set('n', '<F4>', function () dapui.float_element('repl') end)



        wk.add({
            {'<leader>d', group='debug'},
                {'<leader>db', function() dap.toggle_breakpoint() end, desc='Breakpoint'},
                {'<leader>dc', function() dap.continue({}) end, desc='Continue'},
                {'<leader>dt', function() dap.terminate() end, desc='Terminate'},
                {'<leader>du', function() dv.toggle(true) end, desc='Toggle UI'}, -- true arg also toggles the term.
                {'<leader>dr', function() dapui.float_element('repl') end, desc='Toggle REPL'}
        })
    end

}

return new_debug_plugins
