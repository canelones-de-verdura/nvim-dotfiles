-- Binds
vim.keymap.set('n', '<leader>gb', ":Gitsigns toggle_current_line_blame<CR>")
vim.keymap.set('n', '<leader>gp', ":Gitsigns preview_hunk<CR>")

-- Cambio solo el borde de los popups, de rompe bolas nomás
require('gitsigns').setup{
    preview_config = {
        border = 'rounded',
    },
}
