-- Bindea espacio a la leader key
vim.g.mapleader = " "

-- Exploro archivos con espacio+e+x
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Mueven lo que esté seleccionado 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Centran la vista mientras me desplazo
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Bindea jj a Esc
vim.keymap.set("i", "jj", "<Esc>")

-- Reemplaza la palabra bajo el cursor en todo el documento
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Binds para telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.oldfiles, {})
vim.api.nvim_set_keymap(
  "n",
  "<space>fe",
  ":Telescope file_browser<Enter>",
  { noremap = true }
)
