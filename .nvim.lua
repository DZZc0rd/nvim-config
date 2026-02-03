vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            telemetry = {
                enabled = false,
            },
        },
    },
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("stylua")
