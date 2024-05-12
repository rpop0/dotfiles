local debug_plugins = {
    'rcarriga/nvim-dap-ui',
    dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio'
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')
        local wk = require('which-key')
        dapui.setup()

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


        wk.register({
            ["<leader>d"] = { name = "+dap" },
            ["<leader>db"] = { function() dap.toggle_breakpoint() end, "Breakpoint" },
            ["<leader>dc"] = { function() dap.continue() end, "Continue" },
            ["<leader>dt"] = { function() dap.terminate() end, "Terminate" },
            ["<leader>du"] = { function() dapui.toggle() end, "Toggle UI"}
        })
    end
}

return debug_plugins
