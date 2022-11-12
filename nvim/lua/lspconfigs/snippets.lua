local M = {}

function M.setup()
	local status, luasnip = pcall(require, "luasnip")
	if not status then
		vim.notify("failed to load luasnip", "error")
		return
	end

	local status, cmp = pcall(require, "cmp")
	if not status then
		vim.notify("failed to load cmp", "error")
		return
	end

	local conf = {
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
			["<C-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "vsnip" },
		},
	}

	cmp.setup(conf)

	cmp.setup.cmdline(":", {
		sources = {
			{ name = "cmdline" },
		},
	})

	cmp.setup.cmdline("/", {
		sources = {
			{ name = "buffer" },
		},
	})
end

return M
