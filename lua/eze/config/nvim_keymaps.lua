-- Bindea espacio a la leader key
vim.g.mapleader = " "
-- Exploro archivos con espacio+e
vim.keymap.set("n", "<leader>e",  vim.cmd.Lex)
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
-- Adjunto binds de plugins
require("eze.config.plugin_config.fzf_keymaps")
