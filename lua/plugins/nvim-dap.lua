return {
    "mfussenegger/nvim-dap",
    config = function()
        vim.keymap.set("n", "<leader>ql", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
        vim.keymap.set("n", "<leader>qj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
        vim.keymap.set("n", "<leader>qk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
        vim.keymap.set("n", "<leader>qc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
        vim.keymap.set(
            "n",
            "<leader>qb",
            "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
            { desc = "Debugger toggle breakpoint" }
        )
        vim.keymap.set(
            "n",
            "<leader>qd",
            "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
            { desc = "Debugger set conditional breakpoint" }
        )
        vim.keymap.set("n", "<leader>qe", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
        vim.keymap.set("n", "<leader>qr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })
        vim.keymap.set(
            "n",
            "<leader>qt",
            "<cmd>lua vim.cmd('RustLsp testables')<CR>",
            { desc = "Debugger test tables" }
        )
    end,
}
