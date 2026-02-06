-- return {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--         "hrsh7th/cmp-nvim-lsp",
--         "hrsh7th/cmp-buffer",
--         "hrsh7th/cmp-path",
--         "hrsh7th/cmp-cmdline",
--         "L3MON4D3/LuaSnip",
--         "saadparwaiz1/cmp_luasnip",
--         {
--             "folke/lazydev.nvim",
--             ft = "lua",
--             opts = {},
--         },
--     },
--     event = { "InsertEnter", "CmdlineEnter" },
--     config = function()
--     end,
-- }

local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<s-tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<cr>"] = cmp.mapping.confirm({ select = true }),
        ["<c-e>"] = cmp.mapping.abort(),
        ["<c-space>"] = cmp.mapping.complete(),
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

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
