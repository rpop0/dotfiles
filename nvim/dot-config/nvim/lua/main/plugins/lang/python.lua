return {
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
