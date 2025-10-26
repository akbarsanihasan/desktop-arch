return {
    'L3MON4D3/LuaSnip',
    dependencies = {
        'rafamadriz/friendly-snippets'
    },
    build = "make install_jsregexp",
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

        local luasnip = require("luasnip")

        vim.keymap.set({ "i" }, "<C-L>", function() luasnip.expand() end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-J>", function() luasnip.jump(-1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-K>", function() luasnip.jump(1) end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end, { silent = true })
    end
}
