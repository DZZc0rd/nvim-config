return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {},
        },
    },
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mappings = {
                ["<tab>"] = cmp.mapping.select_next_item(),
                ["<s-tab>"] = cmp.mapping.select_prev_item(),
                ["<space>"] = cmp.mapping.complete(),
                ["<cr>"] = cmp.mapping.confirm({ select = true }),
                ["<c-e>"] = cmp.mapping.abort(),
                ["<space>"] = function()
                    print("hrsh7thasd")
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = cmp.config.sources({
                { name = "lazydev" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                -- {name="buffer"},
            }),
        })
    end,
}
