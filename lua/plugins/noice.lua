-- return {
--     "folke/noice.nvim",
--     dependencies = {
--         "MunifTanjim/nui.nvim",
--         "rcarriga/nvim-notify",
--     },
--     event = "VeryLazy",
--     opts = {
--     },
-- }
--
require("noice").setup({
    views = {
        cmdline_popup = {
            position = {
                row = 2,
                col = "50%",
            },
        },
    },
})
