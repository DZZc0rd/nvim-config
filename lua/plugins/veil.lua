return {
    "willothy/veil.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "ibhagwan/fzf-lua",
        "A7Lavinraj/fyler.nvim",
    },
    lazy = false,
    opts = function()
        local builtin = require("veil.builtin")
        local fzf = require("fzf-lua")

        local header = builtin.sections.animated(builtin.headers.frames_nvim, {})

        math.randomseed(os.time())
        if math.random(2) == 2 then
            header = builtin.sections.animated(builtin.headers.frames_days_of_week[os.date("%A")], {})
        end

        local sections = {
            header,
            builtin.sections.buttons({
                {
                    icon = "",
                    text = "Open explorer",
                    shortcut = "e",
                    callback = function()
                        require("fyler").open()
                    end,
                },
                {
                    icon = "",
                    text = "Find file",
                    shortcut = "f",
                    callback = function()
                        require("fzf-lua").files()
                    end,
                },
                {
                    icon = "",
                    text = "Find string",
                    shortcut = "s",
                    callback = function()
                        require("fzf-lua").live_grep()
                    end,
                },
                {
                    icon = "󰈆",
                    text = "Exit from Neovim",
                    shortcut = "q",
                    callback = function()
                        vim.cmd("q")
                    end,
                },
            }),
            builtin.sections.oldfiles(),
        }

        local opts = {
            startup = true,
            sections = sections,
        }

        require("veil").setup(opts)
    end,
}
