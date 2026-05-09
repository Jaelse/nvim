local augroup = vim.api.nvim_create_augroup("LspFromatting", {})
return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettierd,
                require("none-ls.formatting.ruff_format"),
                null_ls.builtins.completion.spell,
                null_ls.builtins.diagnostics.eslint_d,
                require("none-ls.diagnostics.ruff"),
                -- require("none-ls.diagnostics.eslint_d"),
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            local ft = vim.bo[bufnr].filetype
                            vim.lsp.buf.format({
                                bufnr = bufnr,
                                filter = function(c)
                                    if ft == "python" then
                                        return c.name == "null-ls"
                                    end
                                    return true
                                end,
                            })
                        end,
                    })
                end
            end,
        })
        vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format this file" })
    end,
}
