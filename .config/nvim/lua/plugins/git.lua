return {
    "tpope/vim-fugitive",
    keys = {
        {
            "<leader>ga",
            function()
                if not vim.fs.root(0, ".git") then
                    vim.cmd.Git("init")
                end

                vim.cmd.Git()
            end,
            silent = true,
            noremap = true,
        },
        { "gl", ":diffget //2<CR>", silent = true, noremap = true },
        { "gr", ":diffget //3<CR>", silent = true, noremap = true },
    },
}
