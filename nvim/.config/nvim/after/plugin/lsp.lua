local map = require("config.keymap-utils").map
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
    local status, modes_module = pcall(require, "modes")
    local lspMaps = require("config.lsp-keymaps")
    if status then
        modes_module.create_if_not_present(
            "LSP",
            function() end,
            function() end,
            "{}"
        )
        modes_module.add_maps("LSP", lspMaps.get_lsp_maps())

        -- ignore toggle_mode for some lsps
        -- if not vim.tbl_contains(ignore_on_attach_toggle, client.name) then
        modes_module.enable_mode("LSP", { buffer = bufnr })
        -- end

        map("n", "<leader>ldis", function()
            require("modes").toggle_mode(
                "LSP",
                { buffer = vim.api.nvim_get_current_buf() }
            )
        end, { desc = "Toggle COMPL LSP for Current Buffer" })
    else
        lsp_zero.default_keymaps({ buffer = bufnr })
    end
end)

lsp_zero.set_sign_icons({
    error = "",
    warn = "",
    hint = "⚑",
    info = "",
})

require("mason").setup({})

local ensure_installed = {
    "bashls",
    "lua_ls",
    "marksman",
}

local check_installed = {
    "tsserver",
    "gopls",
    "rust_analyzer",
    "jdtls",
}

local function is_installed(lsp)
    local command
    if lsp == "tsserver" then
        command = { "node", "--version" }
    elseif lsp == "gopls" then
        command = { "go", "version" }
    elseif lsp == "rust_analyzer" then
        command = { "rust", " --version" }
    elseif lsp == "jdtls" then
        command = { "java", "--version" }
    else
        return nil
    end

    local status, _ = pcall(vim.system, command)
    return status
end

for _, value in ipairs(check_installed) do
    if is_installed(value) then
        table.insert(ensure_installed, value)
    end
end

require("mason-lspconfig").setup({
    ensure_installed = ensure_installed,
    automatic_installation = true,
    handlers = {
        lsp_zero.default_setup,
        jdtls = function() end,
    },
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
        ["<Tab>"] = cmp.mapping.select_next_item(cmp_select_opts),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select_opts),
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
