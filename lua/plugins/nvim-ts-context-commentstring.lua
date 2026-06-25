return {
    "JoosepAlviste/nvim-ts-context-commentstring",
    require("Comment").setup({
        pre_hook = function(ctx)
            local loaded, ts_context = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
            if loaded and ts_context then
                return ts_context.create_pre_hook()(ctx)
            end
        end,
    }),
}
