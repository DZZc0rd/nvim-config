vim.lsp.config["nixd"] = {
	settings = {
		nixd = {
			formatting = {
				command = { "alejandra" },
			},
			options = {
				nixos = {
					expr = "(builtins.getFlake (toString ./.)).nixosConfigurations.desktop.options",
				},
				home_manager = {
					expr = "(builtins.getFlake (toString ./.)).nixosConfigurations.desktop.home-manager.users.type.getSubOptions []",
				},
			},
		},
	},
}

vim.lsp.enable("nixd")
vim.lsp.enable("statix")
vim.lsp.enable("deadnix")
