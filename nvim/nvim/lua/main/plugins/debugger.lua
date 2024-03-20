local debug_plugins = {
     {
        'mfussenegger/nvim-dap',
        dependencies = {
            {
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
            vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end)
            vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
            vim.keymap.set('n', '<leader>dt', function() require('dap').terminate() end)
        end
    }

}

return debug_plugins
