return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.config("rust_analyzer", {
            autostart = false,
        })
    end,
}
