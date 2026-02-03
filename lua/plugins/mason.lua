return {
    {
        "mason-org/mason.nvim",
        opts = {},
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = {
                    exclude = {
                        "rust_analyzer"
                    }
                }
            })
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "codelldb",
                    "lua_ls",
                    "vimls",
                    "ts_ls",
                    "bashls",
                    "html",
                    "cssls",
                    "tailwindcss",
                    "svelte",
                    "prismals",
                    "pyright",
                    "eslint",
                    "bashls",
                    "gopls",
                    "pylsp",
                },
            })
        end,
    },
}
