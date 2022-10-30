local status, pp = pcall(require, 'plenary.path')
if not status then
    print('failed to load ' .. 'plenary.path')
    return
end

local status, sm = pcall(require, 'session_manager')
if not status then
    print('failed to load ' .. 'session_manager')
    return
end

local status, smc = pcall(require, 'session_manager.config')
if not status then
    print('failed to load ' .. 'session_manager')
    return
end

local conf = {
    sessions_dir = pp:new(vim.fn.stdpath('data'), 'sessions'),
    path_replacer = '__',
    colon_replacer = '++',
    autoload_mode = smc.AutoloadMode.CurrentDir,
    autosave_last_session = true,
    autosave_ignore_not_normal = true,
    autosave_ignore_filetypes = {
        'gitcommit',
        'NvimTree'
    },
    autosave_only_in_session = false,
    max_path_length = 30,
}

sm.setup(conf)
