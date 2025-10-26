return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-context" },
    opts = {
        auto_install = true,
        indent = {
            enable = true
        },
        highlight = {
            enable = true,
        },
        ensure_installed = {
            "go",
            "php",
            "javascript",
            "typescript",
            "c",
            "rust",
            "lua",
            "bash",
            "html",
            "css",
        }
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
        require('treesitter-context').setup {
            enable = true,
            multiwindow = false,
            max_lines = 0,
            min_window_height = 0,
            line_numbers = true,
            multiline_threshold = 20,
            trim_scope = 'outer',
            mode = 'cursor',
            separator = nil,
            zindex = 20,
            on_attach = nil,
        }
    end,
}
