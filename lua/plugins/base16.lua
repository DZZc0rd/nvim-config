return {
	"RRethy/base16-nvim",
	event = "VeryLazy",
	config = function()
		require("base16-colorscheme").with_config({
			notify = true,
		})

		vim.cmd("colorscheme base16-catppuccin-mocha")
	end,
}
