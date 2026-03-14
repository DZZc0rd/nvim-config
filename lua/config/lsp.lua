vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

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

vim.diagnostic.config({
    virtual_lines = true,
    update_in_insert = true,
    severity_sort = true,
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
                ["flake-parts"] = { expr = "(builtins.getFlake (toString ./.)).debug.options" },
            },
        },
    },
}

local cmp_capabilites = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("*", {
    capabilities = cmp_capabilites,
})

vim.lsp.enable({
    "nixd",
    "statix",
    "lua_ls",
    "stylua",
    "rust_analyzer",
    "ts_ls",
    "emmet_language_server",
})
