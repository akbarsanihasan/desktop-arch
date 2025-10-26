return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "mason-org/mason.nvim",
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local nulls = require("null-ls")
        nulls.setup({
            sources = {
                nulls.builtins.formatting.prettierd,
                nulls.builtins.formatting.phpcsfixer,
                nulls.builtins.formatting.shfmt
            }
        })
    end
}
