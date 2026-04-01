local dap = {
    'mfussenegger/nvim-dap-python',
    dependencies = {
        "mfussenegger/nvim-dap"
    },
    ft = 'python',
    config = function()
        -- Mason now automatically adds the bins from $MASON (~./local/share/mason/bin)
        -- to the path, see https://github.com/mason-org/mason.nvim/blob/main/CHANGELOG.md#packageget_install_path-has-been-removed
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
    end
}

return {
    dap
}
