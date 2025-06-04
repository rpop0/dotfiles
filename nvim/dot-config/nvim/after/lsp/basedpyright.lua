return {
    name = "basedpyright",
    filetypes = { "python" },
    cmd = { "basedpyright-langserver", "--stdio" },
    settings = {
        basedpyright = {
            disableOrganizeImports = true, -- ruff_lsp
            analysis = {
                typeCheckingMode = 'recommended',
                diagnosticSeverityOverrides = { -- Disabled diagnostics due to ruff conflicts
                    reportUnusedVariable = 'none',
                    reportUndefinedVariable = 'none',
                    reportAny = 'none',

                    -- Non ruff
                    reportUnusedCallResult = 'none'
                }
            }

        }
    }
}
