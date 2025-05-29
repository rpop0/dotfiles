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
    end
}

return {
    dap
}

