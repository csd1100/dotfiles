local status, jdtls = pcall(require, 'jdtls')
if not status then
    print('failed to load nvim-jdtls.')
    return
end

local nvim_jdtls = require('lspconfigs.java.jdtls')
local status, nvim_jdtls_config = pcall(nvim_jdtls.nvim_jdtls_setup)
if status then
    jdtls.start_or_attach(nvim_jdtls_config)
end
