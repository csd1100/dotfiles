local status, numbers = pcall(require, 'numbers')
if not status then
    print('failed to load ' .. 'numbers')
    return
end

local config = {
    excluded_filetypes = { 'NvimTree', 'dashboard' }
}

numbers.setup(config)
