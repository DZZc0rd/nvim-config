local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
    dashboard.button("e", "  Open explorer", "<cmd>Fyler<cr>"),
    dashboard.button("f", "  Find file", "<cmd>FzfLua files<cr>"),
    dashboard.button("s", "  Find string", "<cmd>FzfLua live_grep<cr>"),
    dashboard.button("q", "󰈆  Quit", "<cmd>q<cr>"),
}

dashboard.section.footer.val = require("alpha.fortune")()

dashboard.config.layout[1].val = 12
dashboard.config.layout[3].val = 6

alpha.setup(dashboard.opts)
