local keymapUtils = require("config.keymap-utils")
local map = keymapUtils.map

local lsp = require("lsp-zero")


local status, fidget = pcall(require, "fidget")
if status then
    fidget.setup()
end

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "sumneko_lua",
    "rust_analyzer",
    "jdtls@1.12.0",
})

-- Fix Undefined global 'vim'
lsp.configure("sumneko_lua", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "",
        warn = "",
        hint = "⚑",
        info = "",
    },
})

lsp.on_attach(function(client, bufnr)
    local status, modesModule = pcall(require, "modes")
    local lspMaps = require("config.lsp-keymaps")
    if status then
        local lspActivate = function(options)
            lspMaps.map_lsp_keys(options.buffer)
        end
        local lspDeactivate = function(options)
            lspMaps.unmap_lsp_keys(options.buffer)
        end

        modesModule.createIfNotPresent("LSP", lspActivate, lspDeactivate, "{}")
        modesModule.toggleMode("LSP", { buffer = bufnr })
        map("n", "<leader>ldis", function()
            require("modes").toggleMode("LSP", { buffer = vim.api.nvim_get_current_buf() })
        end, { desc = "Toggle COMPL LSP for Current Buffer" })
    else
        lspMaps.map_lsp_keys(bufnr)
    end
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
