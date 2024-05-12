local debug_plugins = {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussnegger/nvim-dap',
        'nvim-neotest/nvim-nio'
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')
        local wk = require('which-key')

        dapui.setup()

        -- DAP UI config
        dap.listeners.before.attach.dapui_config = function ()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function ()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function ()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function ()
            dapui.close()
        end

        wk.register({
            ["<leader>d"] = { name = "+dap" },
            ["<leader>db"] = { dap.toggle_breakpoint(), "Breakpoint" },
            ["<leader>dc"] = { dap.continue(), "Continue" },
            ["<leader>dt"] = { dap.terminate(), "Terminate" },
            ["<leader>du"] = { dapui.toggle(), "Toggle UI"}
        })
    end
}

return debug_plugins
