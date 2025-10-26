return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "hrsh7th/nvim-cmp",
    },
    init = function()
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = false,
            signs = {
                text = {
                    [vim.diagnostic.severity.HINT] = "󰛨",
                    [vim.diagnostic.severity.INFO] = "󰌵",
                    [vim.diagnostic.severity.WARN] = "󱧡",
                    [vim.diagnostic.severity.ERROR] = "",
                },
                texthl = {
                    [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                    [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                    [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                    [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                },
            },
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
            callback = function(event)
                local keymap_opts = {
                    noremap = true,
                    silent = true,
                    buffer = event.buf,
                }

                local format_opts = {
                    timeout_ms = 2000,
                    async = false,
                    buffer = event.buf,
                }

                vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
                vim.keymap.set("n", "gf", vim.lsp.buf.references, keymap_opts)
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, keymap_opts)
                vim.keymap.set("n", "]d", function()
                    vim.diagnostic.jump({ count = 1, float = true })
                end, keymap_opts)
                vim.keymap.set("n", "[d", function()
                    vim.diagnostic.jump({ count = -1, float = true })
                end, keymap_opts)
                vim.keymap.set("n", "<leader>vdd", vim.diagnostic.open_float, keymap_opts)
                vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, keymap_opts)
                vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, keymap_opts)
                vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, keymap_opts)
                vim.keymap.set("n", "<leader>vrs", ":LspRestart<CR>", keymap_opts)

                vim.keymap.set("n", "<leader>vfc", function()
                    vim.lsp.buf.format(format_opts)
                end, keymap_opts)

                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("user_lsp_format", { clear = true }),
                    callback = function()
                        vim.lsp.buf.format(format_opts)
                    end,
                })
            end,
        })
    end,
    config = function()
        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        local capabilities = vim.tbl_deep_extend(
            "force",
            {
                textDocument = {
                    foldingRange = {
                        dynamicRegistration = false,
                        lineFoldingOnly = true
                    }
                }
            },
            vim.lsp.protocol.make_client_capabilities(),
            cmp_nvim_lsp.default_capabilities()
        )

        vim.lsp.config("*", {
            single_file_support = true,
            capabilities = capabilities,
        })

        vim.lsp.enable("gopls")
        vim.lsp.enable("phpactor")
        vim.lsp.enable("ts_ls")
        vim.lsp.enable("astro")
        vim.lsp.enable("rust_analyzer")
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("clangd")
        vim.lsp.enable("bash-language-server")
        vim.lsp.enable("emmet_ls")
    end,
}
