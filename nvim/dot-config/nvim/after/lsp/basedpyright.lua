return {
    settings = {
        basedpyright = {
            disableOrganizeImports = true, -- ruff_lsp
            analysis = {
                typeCheckingMode = 'recommended',
                diagnosticSeverityOverrides = { -- Disabled diagnostics due to ruff conflicts
                    reportUnusedVariable = 'none',
                    reportUndefinedVariable = 'none',
                    reportAny = 'none',
                    reportExplicitAny = 'none',
                    reportUnusedCallResult = 'none',
                    reportUnannotatedClassAttribute = 'none'
                }
            },

        }
    },

    handlers = {
        --- filter noisy notifications
        ['$/progress'] = function(err, result, ctx)
            -- just notify once
            if result.token == (vim.g.basedpyright_progress_token or result.token) then
                vim.g.basedpyright_progress_token = result.token
                vim.lsp.handlers['$/progress'](err, result, ctx)
            end
        end,
    },
}
