return {
    "willothy/veil.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    lazy = false,
    opts = {
        startup = true,
    },
    -- config = function(opts)
    --     local builtin = require("veil.builtin")
    --     local sections = {
    --         builtin.section.animated(builtin.headers.frames_nvim),
    --     }
    --
    --     table.insert(opts, {
    --         sections,
    --     })
    --
    --     require("veil").setup(opts)
    -- end,
}
