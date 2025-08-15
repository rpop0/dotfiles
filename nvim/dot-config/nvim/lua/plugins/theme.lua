return{
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            integrations = {
                blink_cmp = true,
                treesitter = true,
                leap = true,
                harpoon = true,
                notify = true,
                dap = true,
                dap_ui = true,
                gitsigns = true,
                alpha = true,
                flash = true,
                noice = true,
                which_key = true
            }
        })
        vim.cmd.colorscheme "catppuccin"
    end
}
