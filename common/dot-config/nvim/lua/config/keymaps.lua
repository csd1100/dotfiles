local ku = require('config.keymap-utils')

ku.map('n', '<C-/>', 'gcc', { desc = 'Toggle Comment', remap = true })
ku.map('v', '<C-/>', 'gc', { desc = 'Toggle Comment', remap = true })
