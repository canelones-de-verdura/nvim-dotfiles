-- Título de la terminal
vim.opt.title = true
-- Números de línea
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 10
vim.opt.signcolumn = "number"
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
-- El swap file me re rompe las bolas
vim.opt.swapfile = false
vim.opt.backup = false
-- Opciones de búsqueda
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- Colores
vim.opt.termguicolors = true
vim.cmd.colorscheme "catppuccin"
-- Varios
vim.opt.updatetime = 50
