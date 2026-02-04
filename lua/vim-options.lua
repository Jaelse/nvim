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
