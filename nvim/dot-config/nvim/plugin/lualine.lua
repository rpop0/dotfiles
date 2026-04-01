vim.pack.add({"https://github.com/nvim-lualine/lualine.nvim"})

local function window()
    return vim.api.nvim_win_get_number(0)
end

local function shorten_branch(branch)
    if string.len(branch) > 20 then
        return string.sub(branch, 1, 30) .. '...'
    end
    return branch
end

require('lualine').setup {
    options = {
        theme = 'auto'
    },
    sections = {
        lualine_b = {
            { 'branch', fmt = shorten_branch }
        },
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
