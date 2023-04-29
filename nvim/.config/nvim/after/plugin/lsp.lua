local map = require("config.keymap-utils").map

local lsp = require("lsp-zero")
lsp.preset("recommended")

local lsp_zero_managed_list = {
    "bashls",
    "tsserver",
    "lua_ls",
    "gopls",
    "rust_analyzer",
    "marksman",
}

local lsp_zero_unmanaged_list = {
    "jdtls",
}

local lsp_list =
    vim.tbl_extend("force", lsp_zero_managed_list, lsp_zero_unmanaged_list)

lsp.ensure_installed(lsp_list)

lsp.skip_server_setup({
    "jdtls",
    "rust_analyzer",
})

require("neodev").setup({
    library = { plugins = { "neotest" }, types = true },
})

-- Fix Undefined global 'vim'
lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            completion = {
                callSnippet = "Replace",
            },
        },
    },
})

lsp.set_sign_icons({
    error = "",
    warn = "",
    hint = "⚑",
    info = "",
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

        -- This is workaround as since v2.0 lsp-zero on_attach also is used by
        -- non lsp-zero lsps
        if vim.tbl_contains(lsp_zero_managed_list, client.name) then
            modesModule.toggleMode("LSP", { buffer = bufnr })
        end
        map("n", "<leader>ldis", function()
            require("modes").toggleMode(
                "LSP",
                { buffer = vim.api.nvim_get_current_buf() }
            )
        end, { desc = "Toggle COMPL LSP for Current Buffer" })
    else
        lspMaps.map_lsp_keys(bufnr)
    end
end)

lsp.setup()

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
        { name = "nvim_lua" },
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-c>"] = cmp.mapping.abort(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<Up>"] = cmp.mapping.select_prev_item(cmp_select_opts),
        ["<Down>"] = cmp.mapping.select_next_item(cmp_select_opts),
        ["<C-p>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item(cmp_select_opts)
            else
                cmp.complete()
            end
        end),
        ["<C-n>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item(cmp_select_opts)
            else
                cmp.complete()
            end
        end),
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_backward(),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        documentation = {
            max_height = 15,
            max_width = 60,
        },
    },
    formatting = {
        fields = { "menu", "abbr", "kind" },

        format = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            before = function(entry, item)
                local menu_icon = {
                    nvim_lsp = "λ",
                    luasnip = "⋗",
                    buffer = "Ω",
                    path = "🖫",
                    nvim_lua = "Π",
                }

                item.menu = menu_icon[entry.source.name]
                return item
            end,
        }),
    },
})

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})
-- `:` cmdline setup.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        {
            name = "cmdline",
            option = {
                ignore_cmds = { "Man", "!" },
            },
        },
    }),
})

local mason_registry = require("mason-registry")

local tools_to_install = {
    "java-test",
    "java-debug-adapter",
    "chrome-debug-adapter",
    "node-debug2-adapter",
}

function mason_install_if_not(tool)
    if
        not mason_registry.is_installed(tool)
        and mason_registry.has_package(tool)
    then
        local package = mason_registry.get_package(tool)
        package:install()
    end
end

vim.tbl_map(mason_install_if_not, tools_to_install)
vim.diagnostic.config({
    virtual_text = true,
})
