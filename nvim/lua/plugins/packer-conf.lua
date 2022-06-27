local M = {}

function M.setup()
    local conf = {
        display = {
            open_fn = function()
                return require("packer.util").float {
                    border = "rounded"
                }
            end
        }
    }
    local packer = require "packer"
    packer.init(conf)
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
end

return M