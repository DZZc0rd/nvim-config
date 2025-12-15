local function source_matugen()
    local matugen_path = os.getenv("HOME") .. "/.cache/matugen/nvim.lua"

    local file, err = io.open(matugen_path, "r")
    if err ~= nil then
        vim.cmd("colorscheme base16-catppuccin-mocha")
        vim.print("A matugen colorscheme was not found. Using catppuccin-mocha instead")
    else
        file:close()
        dofile(matugen_path)

        require("lazy.core.loader").reload("lualine.nvim")
    end
end

return {
    "RRethy/base16-nvim",
    event = "VeryLazy",
    config = function()
        require("base16-colorscheme").with_config({
            notify = true,
        })

        source_matugen()
        vim.api.nvim_create_autocmd("Signal", {
            pattern = "SIGUSR1",
            callback = function()
                source_matugen()
            end,
        })
    end,
}
