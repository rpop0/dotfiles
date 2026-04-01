vim.pack.add({
    'https://github.com/mfussenegger/nvim-dap',
    'https://github.com/igorlfs/nvim-dap-view',
    'https://github.com/thehamsta/nvim-dap-virtual-text',
    'https://github.com/mfussenegger/nvim-dap-python'
})

local dap = require('dap')
local dv = require('dap-view')
local wk = require('which-key')
require('nvim-dap-virtual-text').setup {
    virt_text_pos = 'eol',
    commented = true
}

dv.setup({
    winbar = {
        controls = {enabled = true},
    }
})




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

require('dap-python').setup('debugpy-adapter', {
    -- console = "externalTerminal"
})
table.insert(require('dap').configurations.python, {
    type = 'python',
    request = 'launch',
    name = 'module',

    module = function ()
        -- Convert the current file path to module notation.
        local path = vim.fn.expand('%:.:r') -- Relative path without extension
        return path:gsub('/', '.')
    end,
    args = function()
        local args_string = vim.fn.input('args')
        local utils = require("dap.utils")
        if utils.splitstr and vim.fn.has("nvim-0.10") == 1 then
            return utils.splitstr(args_string)
        end
        return vim.split(args_string, " +")
    end,

})

