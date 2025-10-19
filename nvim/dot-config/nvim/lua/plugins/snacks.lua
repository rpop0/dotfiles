fff = {
    "dmtrKovalenko/fff.nvim",
    build = function()
        require("fff.download").download_or_build_binary()
    end,
    lazy = false, -- make fff initialize on startup
    opts = {
        debug = {
            enabled = true,
            show_scores = true
        }
    },
    -- keys = {
    --     {
    --         "ff",
    --         function() require('fff').find_files() end
    --     }
    -- }
}

fff_snacks = {
    "madmaxieee/fff-snacks.nvim",
    dependencies = {
        "dmtrKovalenko/fff.nvim",
        "folke/snacks.nvim",
    },
    cmd = "FFFSnacks",
    keys = {
        {
            "ff",
            "<cmd> FFFSnacks <cr>",
            desc = "FFF",
        }
    },
    config = true
}

snacks = {
    'folke/snacks.nvim',
    priroity = 1000,
    lazy = false,
    opts = {
        picker = { enabled = true },
        dashboard = { enabled = true, }
    },
    config = function (_, opts)
        local snacks = require('snacks')
        snacks.setup(opts)
        local wk = require('which-key')
        wk.add({
            {'<leader>f', group='find'},
            -- {'ff', function() snacks.picker.smart() end, desc='Find file'},
            {'fg', function() snacks.picker.grep() end, desc='Grep'},
            {'<leader>fb', function() snacks.picker.buffers() end, desc='Buffers'},
            {'<leader>fh', function() snacks.picker.help() end, desc='Help'},
            {'<leader>fh', function() snacks.picker.help() end, desc='Help'},
            {'<leader>fs', function() snacks.picker.spelling() end, desc='Spelling'},

            { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
            { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },

            --- LSP
            {'<leader>fr', function() snacks.picker.lsp_references() end, desc='LSP References'},
            {'<leader>fd', function() snacks.picker.lsp_definitions() end, desc='LSP Definitions'},
            {'<leader>fi', function() snacks.picker.lsp_implementations() end, desc='LSP Implementations'},
        })

    end
}

return {
    fff,
    fff_snacks,
    snacks
}
