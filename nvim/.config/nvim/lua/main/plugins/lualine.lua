return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local function window()
            return vim.api.nvim_win_get_number(0)
        end

        require('lualine').setup {
            options = {
                theme = 'catppuccin'
            },
            sections = {
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                    }
                },
            },
            inactive_sections = {
                lualine_y = { window }

            }

        }
    end
}
