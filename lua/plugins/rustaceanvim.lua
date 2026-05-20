return {
    "mrcjkb/rustaceanvim",
    version = "^7",
    lazy = false,
    config = function()
        local bufnr = vim.api.nvim_get_current_buf()
        vim.keymap.set("n", "<leader>gra", function()
            vim.cmd.RustLsp("codeAction")
        end, { silent = true, buffer = bufnr })

        vim.keymap.set("n", "K", function()
            vim.cmd.RustLsp({ "hover", "actions" })
        end, { silent = true, buffer = bufnr })

        vim.g.rustaceanvim = {
            server = {
                on_attach = function(_, bufnr)
                    vim.keymap.set(
                        "n",
                        "gI",
                        vim.lsp.buf.implementation,
                        { buffer = bufnr, desc = "Go to implementation" }
                    )
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr, async = false })
                        end,
                    })
                end,
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = true,
                        },
                    },
                },
            },
        }
    end,
}
