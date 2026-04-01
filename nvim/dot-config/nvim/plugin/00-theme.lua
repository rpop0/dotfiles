vim.pack.add({ "https://github.com/catppuccin/nvim" })

require("catppuccin").setup({
    transparent_background = true,
    integrations = {
        blink_cmp = true,
        treesitter = true,
        leap = true,
        harpoon = true,
        notify = true,
        dap = true,
        gitsigns = true,
        alpha = true,
        flash = true,
        noice = true,
        which_key = true,
    },
    custom_highlights = function(colors)
        return {
            debugPC = { bg = colors.surface1, bold = true} -- Make the current line the debugger is on highlighted. Needed for transparent bg.
        }
    end,
})
vim.cmd.colorscheme "catppuccin-nvim"
