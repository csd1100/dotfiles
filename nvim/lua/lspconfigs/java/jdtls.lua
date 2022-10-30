local function keymap(bufnr)
end

local status, jdtls = pcall(require, 'jdtls')
if not status then
    print('failed to load nvim-jdtls.')
    return
end

local home = os.getenv('HOME')

local bundles = {
    vim.fn.glob(home ..
        '.local/share/xnvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar'
    )
}
vim.list_extend(bundles,
    vim.split(vim.fn.glob(home .. '.local/share/nvim/mason/packages/java-test/extension/server/*.jar'), '\n')
)

local config = {
    cmd = { home .. '/.local/share/nvim/mason/bin/jdtls' },
    root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}

-- config['init_options'] = {
--     bundles = bundles
-- }
config['on_attach'] = function(client, bufnr)
    print("Hello")
    -- local keymapUtils = require('basic.keymaps-utils')
    -- local map = keymapUtils.map
    -- local unmap = keymapUtils.unmap
    -- local lsp_keymaps = require('lspconfigs.keymaps')
    -- local lspTogggle = function(self)
    --     if self.value then
    --         lsp_keymaps.map_lsp_keys()
    --         map('n', '<leader>joi', '<Cmd>lua require("jdtls").organize_imports()<CR>')
    --         map('n', '<leader>jev', '<Cmd>lua require("jdtls").extract_variable()<CR>')
    --         map('n', '<leader>jvt', '<Cmd>lua require("jdtls").extract_variable(true)<CR>')
    --         map('n', '<leader>jec', '<Cmd>lua require("jdtls").extract_variable()<CR>')
    --         map('n', '<leader>jct', '<Cmd>lua require("jdtls").extract_variable(true)<CR>')
    --         map('n', '<leader>jem', '<Cmd>lua require("jdtls").extract_method(true)<CR>')
    --         map('n', '<leader>jtc', '<Cmd>lua require("jdtls").test_class()<CR>')
    --         map('n', '<leader>jtm', '<Cmd>lua require("jdtls").test_nearest_method()<CR>')
    --     else
    --         lsp_keymaps.unmap_lsp_keys()
    --         unmap('n', '<leader>joi')
    --         unmap('n', '<leader>jev')
    --         unmap('n', '<leader>jvt')
    --         unmap('n', '<leader>jec')
    --         unmap('n', '<leader>jct')
    --         unmap('n', '<leader>jem')
    --         unmap('n', '<leader>jtc')
    --         unmap('n', '<leader>jtm')
    --     end
    -- end
    --
    -- keymapUtils.getModeClass().new('LSP', lspTogggle)
    --
    -- jdtls.setup_dap({ hotcodereplace = 'auto' })
    -- local status, jdtls_dap = pcall(require, 'jdtls.dap')
    -- if not status then
    --     print('failed to load nvim-jdtls.dap')
    --     return
    -- end
    -- jdtls_dap.setup_dap_main_class_configs()
    --
    -- local status, dap = pcall(require, 'dap')
    -- if not status then
    --     print('failed to load dap')
    --     return
    -- end
    -- dap.configurations.java = { {
    --     type = 'java',
    --     request = 'attach',
    --     name = 'Debug (Attach) - Remote',
    --     hostName = '127.0.0.1',
    --     port = 8000
    -- } }

end

jdtls.start_or_attach(config)
print('nvim-jdtls')
