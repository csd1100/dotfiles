local function if_successful_then_setup(plug)
    local status, plugin = pcall(require, plug)
    if status then
        plugin.setup()
        return
    end
end

if_successful_then_setup('tidy')
if_successful_then_setup('nvim-tree')
if_successful_then_setup('colorizer')
if_successful_then_setup('nvim_comment')
if_successful_then_setup('todo-comments')
