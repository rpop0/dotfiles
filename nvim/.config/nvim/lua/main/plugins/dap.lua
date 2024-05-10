local debug_plugins = {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            {
                'nvim-neotest/nvim-nio',
                'rcarriga/nvim-dap-ui',
                config = function ()
                    require('dapui').setup()
                    local listener = require('dap').listeners
                    listener.after.event_initialized["dapui_config"] = function() require("dapui").open() end
                    listener.before.event_terminated["dapui_config"] = function () require("dapui").close() end
                    listener.before.event_exited["dapui_config"] = function() require("dapui").close() end

                    vim.keymap.set('n', '<leader>du', function() require('dapui').toggle() end)
                end

            }
        },
        config = function ()
            local wk = require('which-key')
            wk.register({
                ["<leader>d"] = { name = "+dap"},
                ["<leader>db"] = {function() require('dap').toggle_breakpoint() end, "Breakpoint"},
                ["<leader>dc"] = {function() require('dap').continue() end, "Continue"},
                ["<leader>dt"] = {function() require('dap').terminate() end, "Terminate"}
            })
        end
    }

}

return debug_plugins
