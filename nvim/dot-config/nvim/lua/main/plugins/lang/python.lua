local dap = {
    'mfussenegger/nvim-dap-python',
    dependencies = {
        "mfussenegger/nvim-dap"
    },
    ft = 'python',
    config = function()
        local debugpyPath = require('mason-registry').get_package('debugpy'):get_install_path() .. "/venv/bin/python3"
        require('dap-python').setup(debugpyPath, {
            console = "externalTerminal"
        })
    end
}

local visidata = {
    'Willem-J-an/visidata.nvim',
    dependencies = {
        'mfussenegger/nvim-dap-python',
        'mfussenegger/nvim-dap'
    },
    ft = 'python',
    config = function ()
        local wk = require('which-key')
        local vd = require("visidata")

        wk.add({
            {'<leader>d', group='debug'},
                {'<leader>dp', vd.visualize_pandas_df, desc='View dataframe'},
        })
    end

}

return {
    dap,
    visidata

}
