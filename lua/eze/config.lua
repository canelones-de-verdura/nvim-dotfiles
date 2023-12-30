-- Título de la terminal
vim.opt.title = false
-- Números de línea
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.colorcolumn = '0'
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
vim.opt.background = "light"
-- Status line
vim.opt.cmdheight=1
vim.opt.laststatus = 3
vim.opt.showtabline = 1
vim.opt.showmode = false
-- Folds
vim.opt.fillchars = { fold = " " }
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldcolumn = '0'
-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_cursor = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_localcopydircmd = 'cp -r'
-- Binds
-- Faltan las de telescope y nvim-cmp. Esas están en plugins/.
-- Exploro archivos con espacio+e
vim.keymap.set("n", "<leader>e",  vim.cmd.Ex)
-- Salgo de insert mode
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")
-- Me muevo entre buffers
vim.keymap.set("n", "<Tab>",  vim.cmd.bn)
vim.keymap.set("n", "<S-Tab>",  vim.cmd.bp)
-- Cierro buffers
vim.keymap.set("n", "<leader>c", vim.cmd.bd)
-- Mueven lo que esté seleccionado 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Centran la vista mientras me desplazo
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Reemplaza la palabra bajo el cursor en todo el documento
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Varios
vim.opt.updatetime = 50
