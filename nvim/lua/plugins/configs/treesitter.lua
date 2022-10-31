local status, ts = pcall(require, 'nvim-treesitter.configs')
if not status then
    vim.notify('failed to load nvim-treesitter.configs', 'error')
    return
end

local conf = {
    ensure_installed = { 'bash', 'json', 'markdown', 'yaml', 'lua', 'regex' },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
}

ts.setup(conf)
