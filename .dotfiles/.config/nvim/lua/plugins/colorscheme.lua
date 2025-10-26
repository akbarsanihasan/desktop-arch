return {
    "catppuccin/nvim",
    name = "catppuccin",
    init = function()
        vim.cmd.colorscheme("catppuccin")
    end,
    opts = {
        flavour = "auto",
        auto_integrations = true,
        term_colors = true,
        background = {
            light = "latte",
            dark = "mocha",
        },
        float = {
            transparent = true,
            solid = false,
        },
        styles = {
            booleans = { "bold" },
            functions = { "bold" },
            comments = { "italic" },
            types = { "italic" },
        },
    },
}
