return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                -- neo-tree will lazily load itself
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
        })
        require("transparent").clear_prefix("NeoTree")
        vim.keymap.set("n", "<leader>ee", ":Neotree filesystem reveal left<CR>", { desc = "Releave filesystem" })
        vim.keymap.set("n", "<leader>eq", ":Neotree close <CR>", { desc = "Close filesystem" })
    end,
}
