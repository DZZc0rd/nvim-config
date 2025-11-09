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
                ["home-manager"] = {
                    expr =
                    "(builtins.getFlake (toString ./.)).nixosConfigurations.desktop.options.home-manager.users.type.getSubOptions []",
                },
            },
        },
    },
}

vim.lsp.enable("nixd")
vim.lsp.enable("statix")
vim.lsp.enable("deadnix")
