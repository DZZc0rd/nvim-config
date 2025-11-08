return {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    keys = {
        { "<leader>ee", "<cmd>Fyler<cr>", desc = "Open file explorer" },
    },
    opts = {
        default_explorer = true,
        win = {
            border = "single",
            kind = "float",
            kind_presets = {
                float = {
                    width = "0.24rel",
                    height = "1rel",
                    top = "1abs",
                    left = "1abs",
                },
            },
        },
    },
}
