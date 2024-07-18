return {
    {
        'goolord/alpha-nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local dashboard = require('alpha.themes.dashboard');
            local alpha = require('alpha');

            dashboard.section.header.val = {
                "                                                     ",
                "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                "                                                     ",
            }

            dashboard.section.buttons.val = {
                dashboard.button("-", "  File explorer"),
                dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("SPC f f", "󰱼  Find file"),
                dashboard.button("SPC f g", "󰊄  Live grep"),
                dashboard.button("c", "  Settings", "<cmd>cd $HOME/.config/nvim<CR> | :e .<CR>"),
                dashboard.button("q", "  Quit", ":qa<CR>"),
            }

            alpha.setup(dashboard.opts);
        end
    }
}
