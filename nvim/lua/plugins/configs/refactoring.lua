local M = {}

function M.setup()
    local status, ref = pcall(require, 'refactoring')
    if not status then
        print('failed to load ' .. 'refactoring')
        return
    end

    local status, telescope = pcall(require, 'telescope')
    if not status then
        print('failed to load ' .. 'telescope')
        return
    end

    local conf = {
        prompt_func_return_type = {
            go = false,
            java = false,

            cpp = false,
            c = false,
            h = false,
            hpp = false,
            cxx = false,
        },
        prompt_func_param_type = {
            go = false,
            java = false,

            cpp = false,
            c = false,
            h = false,
            hpp = false,
            cxx = false,
        },
        printf_statements = {},
        print_var_statements = {},
    }

    ref.setup()
    telescope.load_extension("refactoring")
end

return M
