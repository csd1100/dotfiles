function if_successful(plugin)
    local status, plug = pcall(require, plugin)
    if not status then
        print('failed to load ' .. plugin)
        return
    end
    return plug
end

local M = {}

function M.setup()
    local pu = if_successful('packer.util')

    local conf = {
        display = {
            open_fn = function()
                return pu.float {
                    border = 'rounded'
                }
            end
        }
    }
    local packer = require 'packer'
    packer.init(conf)
    if_successful('plugins.plugin_specification')
end

return M
