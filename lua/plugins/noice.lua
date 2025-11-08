return {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    opts = {
        views = {
            cmdline_popup = {
                position = {
                    row = 2,
                    col = "50%",
                },
            },
        },
    },
}
