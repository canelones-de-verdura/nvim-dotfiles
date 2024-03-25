-- Bind "global", para poder buscar entre todas las opciones
vim.keymap.set('n', '<leader>t', ':Telescope<CR>')

-- Binds específicas
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>d', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>?', builtin.help_tags, {})

-- Dejo la config predeterminada
require("telescope").setup {}
