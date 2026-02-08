local wk = require("which-key")

wk.setup({
    win = {
        border = "single",
        width = { min = 20, max = 90 },
        row = -2,
        col = 2,
    },
})

wk.add({ "<leader>f", group = "Find" })
