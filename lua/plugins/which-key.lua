return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = { { "<leader>?", "<cmd>WhichKey<cr>", desc = "Show keymap cheatsheet" } },
    opts = {
        win = {
            width = { min = 20, max = 90 },
            row = -2,
            col = 2,
        },
    },
}
