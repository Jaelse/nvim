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
      require("mason-lspconfig").setup()
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "lua_ls",
          "vimls",
          "rust_analyzer",
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
        },
      })
    end,
  },
}
