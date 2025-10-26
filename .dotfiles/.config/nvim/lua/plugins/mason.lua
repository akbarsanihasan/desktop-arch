return {
    "mason-org/mason.nvim",
    dependencies = { "WhoIsSethDaniel/mason-tool-installer" },
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    },
    config = function(_, opts)
        require("mason").setup(opts)
        require("mason-tool-installer").setup({
            auto_update = true,
            run_on_start = true,
            start_delay = 3000,
            ensure_installed = {
                "gopls",
                "typescript-language-server",
                "astro-language-server",
                "phpactor",
                "lua-language-server",
                "bash-language-server",
                "emmet-language-server",

                -- Formatter
                "prettierd",
                "php-cs-fixer",
                "shfmt",
            },
        })
    end,
}
