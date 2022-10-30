local status, packer = pcall(require, 'packer')
if not status then
    print('failed to load packer')
    return
end

local status, pu = pcall(require, 'packer.util')
if not status then
    print('failed to load packer.util')
    return
end

local conf = {
    display = {
        open_fn = function()
            return pu.float {
                border = 'rounded'
            }
        end
    },
    profile = {
        enable = true,
    }
}
packer.init(conf)
require('plugins.plugin_specification')
