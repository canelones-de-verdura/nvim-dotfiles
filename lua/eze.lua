--[[ Config personal ]]
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
vim.opt.breakindent = true
-- El swap file me re rompe las bolas
vim.opt.swapfile = false
vim.opt.backup = false
-- Opciones de búsqueda
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- Colores
vim.opt.termguicolors = true
vim.opt.background = "light"
-- Status line
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.showtabline = 1
vim.opt.showmode = true
-- Folds
vim.opt.fillchars = { fold = " " }
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldcolumn = '0'
-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = false
-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_cursor = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 30
vim.g.netrw_preview = 1
vim.g.netrw_browse_split = 0
vim.g.netrw_localcopydircmd = 'cp -r'
-- Completion menu
vim.opt.completeopt = "menu,menuone,popup"
vim.opt.pumblend = 15 -- Transparencia
-- Binds
-- Faltan las de telescope, nvim-lspconfig y gitsigns. Esas están en configs/.
-- Leader key
vim.g.mapleader = " "
-- Borro el resaltado de búsqueda con esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Exploro archivos con espacio+e, espacio+l
vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
vim.keymap.set('n', '<leader>l', vim.cmd.Lex)
-- Me muevo entre buffers
vim.keymap.set("n", "<Tab>", vim.cmd.bn)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bp)
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
-- Completado
-- Omnicompletion
vim.keymap.set("i", "<C-o>", "<C-x><C-o>")
-- File completion
vim.keymap.set("i", "<C-f>", "<C-x><C-f>")
-- Close completion
vim.keymap.set("i", "<C-z>", "<C-x><C-z>")
-- Autocommands
-- Highlight when yanking (copying) text - Afanado de kickstart.nvim
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
-- Varios
vim.opt.updatetime = 50
require("configs.statusline")
