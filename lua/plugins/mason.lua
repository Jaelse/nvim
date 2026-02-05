return {
    {
        "mason-org/mason.nvim",
        dependencies = {
            "artemave/workspace-diagnostics.nvim",
        },
        opts = {
            servers = {
                ts_ls = {
                    on_attach = function(client, bufnr)
                        require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
                    end,
                },
            },
        },
        config = function(_, opts)
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
            vim.diagnostic.config({
                virtual_text = true,
                underline = true,
            })
            for server, config in pairs(opts.servers) do
                vim.lsp.config(server, config)
                vim.lsp.enable(server)
            end
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
                        "rust_analyzer",
                    },
                },
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
