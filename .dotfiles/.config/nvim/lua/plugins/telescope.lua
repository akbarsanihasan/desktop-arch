return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        'nvim-lua/popup.nvim',
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    event = { "BufEnter" },
    keys = {
        { "<C-p>",      ":Telescope find_files follow=true hidden=true<cr>",  silent = true, noremap = true, },
        { "<leader>tw", ":Telescope grep_string follow=true hidden=true<cr>", silent = true, noremap = true, },
        { "<leader>ts", ":Telescope live_grep follow=true hidden=true<cr>",   silent = true, noremap = true, },
        { "<leader>tg", ":Telescope git_files follow=true hidden=true<cr>",   silent = true, noremap = true, },
    },
    opts = {
        defaults = {
            prompt_prefix = " 󰭎  ",
            selection_caret = " ",
            path_display = {
                filename_first = {}
            },
            sorting_strategy = "ascending",
            layout_strategy = "vertical",
            layout_config = {
                width = 0.50,
                anchor = "N",
                prompt_position = "top",
                preview_cutoff = 10,
                mirror = true
            },
            file_ignore_patterns = {
                "^.git/",
                "^node_modules/",
                "^vendor/"
            },
        },
    },
}
