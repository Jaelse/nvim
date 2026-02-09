vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.wo.number = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.winborder = "rounded"
vim.o.mouse = a

vim.keymap.set("n", "<leader>gt", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    vim.notify(vim.lsp.inlay_hint.is_enabled() and "Inlay Hints Enabled" or "Inlay Hints Disabled")
end, { desc = "Toggle inlay hints" })

vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit Terminal Mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
