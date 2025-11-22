return {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    keys = {
        { "<leader>ee", "<cmd>Fyler<cr>", desc = "Open file explorer" },
    },
    opts = {
        views = {
            finder = {
                default_explorer = true,
                indentscope = {
                    marker = "┊",
                },
                win = {
                    border = "single",
                    kind = "float",
                    kinds = {
                        float = {
                            width = "24%",
                            height = "100%",
                            top = "1",
                            left = "1",
                        },
                    },
                    win_opts = {
                        cursorline = true,
                        foldcolumn = "2",
                    },
                },
            },
        },
    },
}
