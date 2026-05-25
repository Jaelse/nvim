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
                    local timer = vim.uv.new_timer()
                    vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
                        buffer = bufnr,
                        callback = function()
                            timer:stop()
                            timer:start(2000, 0, vim.schedule_wrap(function()
                                if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].modified then
                                    vim.api.nvim_buf_call(bufnr, function()
                                        vim.cmd("silent! write")
                                    end)
                                end
                            end))
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
