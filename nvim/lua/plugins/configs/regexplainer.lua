local status, regexplainer = pcall(require, 'regexplainer')
if not status then
    print('failed to load regexplainer')
    return
end

local config = {

    mode = 'narrative', -- TODO: 'ascii', 'graphical'
    -- automatically show the explainer when the cursor enters a regexp
    auto = false,
    -- filetypes (i.e. extensions) in which to run the autocommand
    filetypes = { 'html', 'js', 'cjs', 'mjs', 'ts', 'jsx', 'tsx', 'cjsx', 'mjsx' },
    -- 'split', 'popup', 'pasteboard'
    display = 'popup',

    -- regexplainer splkey: v --
    mappings = {
        toggle = '<leader>rt',
        show = '<leader>rS',
        hide = '<leader>rH',
        show_split = '<leader>rsp'
    },

    narrative = {
        separator = '\n'
    }
}

regexplainer.setup(config)
