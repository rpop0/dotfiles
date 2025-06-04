return {
    'lewis6991/gitsigns.nvim',
    config = function ()
        require('gitsigns').setup{
            on_attach = function ()
                local gs = package.loaded.gitsigns
                local wk = require("which-key")

                wk.add({
                    {"<leader>g", group="git"},
                    {"<leader>gp", gs.preview_hunk, desc="Preview hunk"},
                    {"<leader>gr", gs.reset_hunk, desc="Reset hunk"},
                    {"<leader>gb", function() gs.blame_line{full=true} end, desc="Git blame hunk"},
                    {"<leader>gs", gs.stage_hunk, desc="Stage hunk"},
                    {"<leader>gu", gs.undo_stage_hunk, desc="Undo stage hunk"},
                    {"<leader>gd", gs.diffthis, desc="Show diffs"}

                })
                -- Text objects
                vim.keymap.set('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                vim.keymap.set('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
            end
        }
    end
}

