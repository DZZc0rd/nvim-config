vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf)
        end

        if
            not client:supports_method("textDocument/willSaveWaitUntil")
            and client:supports_method("textDocument/formatting")
        then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end,
})

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
