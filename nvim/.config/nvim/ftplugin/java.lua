local status, jdtls = pcall(require, "jdtls")
if not status then
	vim.notify("failed to load nvim-jdtls.", "error")
	return
end

local function file_exists(name)
	local f = io.open(name, "r")
	return f ~= nil and io.close(f)
end

local function keymap(bufnr)
	local keymapUtils = require("config.keymap-utils")
	local map = keymapUtils.map
	local unmap = keymapUtils.unmap

	local lsp_keymaps = require("config.lsp-keymaps")

	local status, modesModule = pcall(require, "modes")
	if not status then
		print("modes plugin not installed or not properly configured, activating only basic keymaps directly")
		lsp_keymaps.map_lsp_keys(bufnr)
		return
	end

	local lspActivate = function(options)
		lsp_keymaps.map_lsp_keys(options.buffer)
		map(
			"n",
			"<leader>li",
			':lua require("jdtls").organize_imports()<CR>',
			{ buffer = bufnr, desc = "Organize Imports (LSP:Java)" }
		)

		map(
			"n",
			"<leader>lev",
			':lua require("jdtls").extract_variable()<CR>',
			{ buffer = bufnr, desc = "Extract Variable (LSP:Java)" }
		)
		map(
			"v",
			"<leader>lev",
			':lua require("jdtls").extract_variable(true)<CR>',
			{ buffer = bufnr, desc = "Extract Variable (LSP:Java)" }
		)

		map(
			"n",
			"<leader>lec",
			':lua require("jdtls").extract_constant()<CR>',
			{ buffer = bufnr, desc = "Extract Constant (LSP:Java)" }
		)
		map(
			"v",
			"<leader>lec",
			':lua require("jdtls").extract_constant(true)<CR>',
			{ buffer = bufnr, desc = "Extract Constant (LSP:Java)" }
		)

		map(
			"v",
			"<leader>lem",
			':lua require("jdtls").extract_method(true)<CR>',
			{ buffer = bufnr, desc = "Extract Method (LSP:Java)" }
		)

		map(
			"n",
			"<leader>ltc",
			':lua require("jdtls").test_class()<CR>',
			{ buffer = bufnr, desc = "Test Class (LSP:Java)" }
		)
		map(
			"n",
			"<leader>ltm",
			':lua require("jdtls").test_nearest_method()<CR>',
			{ buffer = bufnr, desc = "Test Nearest (LSP:Java)" }
		)
	end
	local lspDeactivate = function(options)
		lsp_keymaps.unmap_lsp_keys(options.buffer)
		unmap("n", "<leader>joi", options)
		unmap("n", "<leader>jev", options)
		unmap("n", "<leader>jvt", options)
		unmap("n", "<leader>jec", options)
		unmap("n", "<leader>jct", options)
		unmap("n", "<leader>jem", options)
		unmap("n", "<leader>jtc", options)
		unmap("n", "<leader>jtm", options)
	end

	modesModule.createIfNotPresent("JLSP", lspActivate, lspDeactivate, "{}")
	modesModule.toggleMode("JLSP", { buffer = bufnr })
end

local function nvim_jdtls_setup()
	local home = os.getenv("HOME")

	if not file_exists(home .. "/.local/share/nvim/mason/bin/jdtls") then
		vim.notify("jdtls not installed. Install jdtls using mason.", "error")
		error("jdtls not installed. Install jdtls using mason.", 2)
	end

	local config = {
		cmd = { home .. "/.local/share/nvim/mason/bin/jdtls" },
		root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
		filetypes = { "java" },
		autostart = true,
	}

	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	local workspace_dir = os.getenv("NVIM_JAVA_WORKSPACE_DIR")
	if not workspace_dir then
		workspace_dir = home .. "/work/java/workspace" .. "/" .. project_name
	end
	vim.list_extend(config["cmd"], { "-data", workspace_dir })

	-- This bundles definition is the same as in the previous section (java-debug installation)
	local bundles = {
		vim.fn.glob(
			home
				.. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
			1
		),
	}

	-- This is the new part
	vim.list_extend(
		bundles,
		vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1), "\n")
	)

	config["init_options"] = {
		bundles = bundles,
	}

	config["on_attach"] = function(client, bufnr)
		keymap(bufnr)
		local status, jdtls_dap = pcall(require, "jdtls.dap")
		if not status then
			vim.notify("failed to load nvim-jdtls.dap", "error")
			return
		end
		jdtls.setup_dap({ hotcodereplace = "auto" })
		jdtls_dap.setup_dap_main_class_configs()

		require("lspconfigs.dap.java").setup()
	end

	config.handlers["language/status"] = function() end

	return config
end

jdtls.start_or_attach(nvim_jdtls_setup())
