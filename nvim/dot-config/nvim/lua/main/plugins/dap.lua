local debug_plugins = {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio',
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')
        local wk = require('which-key')
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
                }
            }

        })

        dap.defaults.fallback.external_terminal = {
            command = "tmux",
            args = { "split-window", "-h", "-d", "-p", "35" }
        }

        -- DAP UI config
        dap.listeners.after.event_initialized.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
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

return debug_plugins
