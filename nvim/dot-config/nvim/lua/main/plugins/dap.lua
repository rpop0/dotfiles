local new_debug_plugins = {
    'mfussenegger/nvim-dap',
    dependencies = {
        {'igorlfs/nvim-dap-view', opts={
            winbar = { 
                controls = {enabled = true},
                sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" }
            }
        }},
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
        vim.keymap.set('n', '<F4>', function () dv.jump_to_view('repl') end)



        wk.add({
            {'<leader>d', group='debug'},
                {'<leader>db', function() dap.toggle_breakpoint() end, desc='Breakpoint'},
                {'<leader>dc', function() dap.continue({}) end, desc='Continue'},
                {'<leader>dt', function() dap.terminate() end, desc='Terminate'},
                {'<leader>du', function() dv.toggle(true) end, desc='Toggle UI'}, -- true arg also toggles the term.
        })
    end

}

return new_debug_plugins
