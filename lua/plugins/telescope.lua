return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string" },
	},
}
