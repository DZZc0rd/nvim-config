vim.lsp.config("lua_ls", {
	settings = {
		diagnostics = {
			globals = { "vim" },
		},
	},
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("stylua")
