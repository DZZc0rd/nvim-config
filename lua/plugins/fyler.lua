require("fyler").setup({
    views = {
        finder = {
            default_explorer = true,
            indentscope = {
                markers = {
                    { "┊", "FylerIndentMarker" },
                },
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
})
