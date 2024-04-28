local function augroup(name)
    return vim.api.nvim_create_augroup("csd_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("disable_session_persistence"),
    pattern = { "gitcommit" },
    callback = function()
        require("persistence").stop()
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client ~= nil and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
        end
        -- whatever other lsp config you want
    end,
})
