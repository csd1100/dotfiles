local status, mason = pcall(require, 'mason')
if not status then
    print('failed to load mason')
    return
end
mason.setup()
