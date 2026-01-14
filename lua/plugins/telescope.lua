return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-args.nvim" } },
    config = function()
        local telescope = require("telescope")
        telescope.setup({})
        telescope.load_extension("live_grep_args")
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    end,
}
