local origami =  {
	"chrisgrieser/nvim-origami",
	event = "VeryLazy",
	opts = {
        foldKeymaps = {
            setup = false
        },
        autoFold = {
            enabled = false
        }
    }, -- required even when using default config

	-- recommended: disable vim's auto-folding
	init = function()
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
	end,
}

return {origami}
