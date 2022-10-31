local status, numbers = pcall(require, 'numbers')
if not status then
    vim.notify('failed to load numbers', 'error')
    return
end

local config = {
    excluded_filetypes = { 'NvimTree', 'dashboard' }
}

numbers.setup(config)
