vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("bashls")
vim.lsp.enable("svelte")
vim.lsp.enable("vimls")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("prismals")
vim.lsp.enable("eslint")
vim.lsp.enable("docker_compose_language_service")
vim.lsp.enable("taplo")
vim.lsp.enable("ty")
vim.lsp.enable("black")
vim.lsp.enable("isort")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.supports_method("textDocument/documentHighlight") then
      local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = args.buf,
        group = group,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = args.buf,
        group = group,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
