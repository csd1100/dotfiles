local status, jdtls = pcall(require, 'jdtls')
if not status then
    print('failed to load nvim-jdtls.')
    return
end

local function keymap()
    local keymapUtils = require('basic.keymaps-utils')
    local map = keymapUtils.map
    local unmap = keymapUtils.unmap
    local lsp_keymaps = require('lspconfigs.keymaps')

    local lspTogggle = function(self)
        if self.value then
            lsp_keymaps.map_lsp_keys()
            map('n', '<leader>li', ':lua require("jdtls").organize_imports()<CR>',
                { buffer = bufnr, desc = 'Organize Imports (LSP:Java)' })

            map('n', '<leader>lev', ':lua require("jdtls").extract_variable()<CR>',
                { buffer = bufnr, desc = 'Extract Variable (LSP:Java)' })
            map('v', '<leader>lev', ':lua require("jdtls").extract_variable(true)<CR>',
                { buffer = bufnr, desc = 'Extract Variable (LSP:Java)' })

            map('n', '<leader>lec', ':lua require("jdtls").extract_constant()<CR>',
                { buffer = bufnr, desc = 'Extract Constant (LSP:Java)' })
            map('v', '<leader>lec', ':lua require("jdtls").extract_constant(true)<CR>',
                { buffer = bufnr, desc = 'Extract Constant (LSP:Java)' })

            map('v', '<leader>lem', ':lua require("jdtls").extract_method(true)<CR>',
                { buffer = bufnr, desc = 'Extract Method (LSP:Java)' })

            map('n', '<leader>ltc', ':lua require("jdtls").test_class()<CR>',
                { buffer = bufnr, desc = 'Test Class (LSP:Java)' })
            map('n', '<leader>ltm', ':lua require("jdtls").test_nearest_method()<CR>',
                { buffer = bufnr, desc = 'Test Nearest (LSP:Java)' })
        else
            unmap('n', '<leader>joi')
            unmap('n', '<leader>jev')
            unmap('n', '<leader>jvt')
            unmap('n', '<leader>jec')
            unmap('n', '<leader>jct')
            unmap('n', '<leader>jem')
            unmap('n', '<leader>jtc')
            unmap('n', '<leader>jtm')
        end
    end

    local LSP = keymapUtils.getModeClass().new('LSP', lspTogggle)
    LSP:toggle()

end

local M = {}

function M.nvim_jdtls_setup()

    local home = os.getenv('HOME')

    if not vim.fn.filereadable(home .. '/.local/share/nvim/mason/bin/jdtls') then
        error('jdtls not installed. Install jdtls using mason.')
    end

    local config = {
        cmd = { home .. '/.local/share/nvim/mason/bin/jdtls' },
        root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
        filetypes = { 'java' },
        autostart = true,
    }

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = os.getenv('NVIM_JAVA_WORKSPACE_DIR')
    if not workspace_dir then
        workspace_dir = home .. '/work/java/workspace' .. '/' .. project_name
    end
    vim.list_extend(config['cmd'], { '-data', workspace_dir })

    -- This bundles definition is the same as in the previous section (java-debug installation)
    local bundles = {
        vim.fn.glob(home ..
            "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
            , 1),
    }

    -- This is the new part
    vim.list_extend(bundles,
        vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1), "\n"))

    config['init_options'] = {
        bundles = bundles;
    }

    config['on_attach'] = function(client, bufnr)
        keymap()
        local status, jdtls_dap = pcall(require, 'jdtls.dap')
        if not status then
            print('failed to load nvim-jdtls.dap')
            return
        end
        jdtls.setup_dap({ hotcodereplace = 'auto' })
        jdtls_dap.setup_dap_main_class_configs()

        local status, dap = pcall(require, 'dap')
        if not status then
            print('failed to load dap')
            return
        end
        dap.configurations.java = { {
            type = 'java',
            request = 'attach',
            name = 'Debug (Attach) - Remote',
            hostName = '127.0.0.1',
            port = 8000
        } }
    end

    local status, notify = pcall(require, 'notify')
    if status then
        config.handlers = {}
        config.handlers['language/status'] = function(_, data, ctx)
            require('plugins.configs.notifications').handle_jdtls_notifications(data.message, ctx.client_id)
        end
    end

    return config
end

return M
