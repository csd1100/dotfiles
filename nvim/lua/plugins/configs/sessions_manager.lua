local status, pp = pcall(require, 'plenary.path')
if not status then
    print('failed to load ' .. 'plenary.path')
    return
end

local status, sm = pcall(require, 'auto-session')
if not status then
    print('failed to load ' .. 'auto-session')
    return
end

local conf = {
    log_level = 'info',
    auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
    auto_session_enabled = true,
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
    auto_session_use_git_branch = true,
}

sm.setup(conf)
