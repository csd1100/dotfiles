local status, cl = pcall(require, 'nvim-cursorline')
if not status then
    print('failed to load nvim-cursorline')
    return
end

local conf = {
    cursorline = {
        enable = true,
        timeout = 1000,
        number = false
    },
    cursorword = {
        enable = true,
        min_length = 3,
        hl = {
            underline = true
        }
    }
}

cl.setup(conf)
