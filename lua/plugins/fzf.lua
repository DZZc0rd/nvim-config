return {
    "ibhagwan/fzf-lua",
    keys = {
        { "<leader>ff", "<cmd>FzfLua files<cr>",     desc = "Find file" },
        { "<leader>fb", "<cmd>FzfLua buffers<cr>",   desc = "Find buffer" },
        { "<leader>fs", "<cmd>FzfLua live_grep<cr>", desc = "Find string" },
    },
    opts = {
        winopts = {
            border = "single",
            preview = {
                border = "single",
            },
        },
    },
}
