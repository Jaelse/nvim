vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.wo.number = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.winborder = "rounded"
vim.opt.updatetime = 300
vim.o.mouse = a

vim.keymap.set("n", "<leader>gt", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    vim.notify(vim.lsp.inlay_hint.is_enabled() and "Inlay Hints Enabled" or "Inlay Hints Disabled")
end, { desc = "Toggle inlay hints" })

vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "gri", vim.lsp.buf.definition, { desc = "Go to definition" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit Terminal Mode" })

--Linux and Windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.g.transparent_enabled = true

-- Select text in visual mode, then use . to replace each occurrence, n to skip
vim.keymap.set("v", "<leader>r", function()
    vim.cmd('noau normal! "vy"')
    local text = vim.fn.getreg('v')
    local escaped = vim.fn.escape(text, '/\\'):gsub('\n', '\\n')
    vim.fn.setreg('/', '\\V' .. escaped)
    vim.opt.hlsearch = true
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>`<cgn', true, false, true), 'n', false)
end, { desc = "Replace occurrences one by one" })

vim.keymap.set("n", "<A-l>", "$", { desc = "Go to end of the line" })
vim.keymap.set("n", "<leader><S-l>", "v$", { desc = "Go to end of the line" })

vim.keymap.set("n", "<A-h>", "^", { desc = "Go to beginning of the line" })
vim.keymap.set("n", "<leader><S-h>", "v^", { desc = "Go to beginning of the line" })

-- MAC OS
vim.keymap.set("n", "<D-l>", "$", { desc = "Go to end of the line" })
vim.keymap.set("n", "<leader><S-l>", "v$", { desc = "Go to end of the line" })

vim.keymap.set("n", "<D-h>", "^", { desc = "Go to beginning of the line" })
vim.keymap.set("n", "<leader><S-h>", "v^", { desc = "Go to beginning of the line" })
