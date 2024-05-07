return {
    'lewis6991/gitsigns.nvim',
    config = function ()
        require('gitsigns').setup{
            on_attach = function ()
                local gs = package.loaded.gitsigns
                local wk = require("which-key")

                wk.register({
                    ["<leader>g"] = { name = "+git"},
                    ["<leader>gp"] = { gs.preview_hunk, "Preview hunk" },
                    ["<leader>gr"] = { gs.reset_hunk, "Reset hunk" },
                    ["<leader>gb"] = { function() gs.blame_line{fulll=true} end, "Git blame hunk" },
                    ["<leader>gs"] = { gs.stage_hunk, "Stage hunk" },
                    ["<leader>gu"] = { gs.undo_stage_hunk, "Undo stage hunk"},
                    ["<leader>gd"] = { gs.diffthis, "Show diffs"},

                })

                -- Text objects
                vim.keymap.set('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                vim.keymap.set('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        }
    end
}

