--[[ Instalamos Lazy para administrar paquetes ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

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
-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = false
-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_cursor = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_winsize = 30
vim.g.netrw_preview = 1
vim.g.netrw_localcopydircmd = 'cp -r'

-- Binds
-- Faltan las de telescope, nvim-cmp y gitsigns. Esas están en lua/configs/.
-- Leader key
vim.g.mapleader = " "
-- Borro el resaltado de búsqueda con esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Exploro archivos con espacio+e
vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
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

-- Autocommands
-- Highlight when yanking (copying) text - Afanado de kickstart.nvim
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--[[ Adjunto plugins ]]
require("lazy").setup(
    "plugins",
    {
        ui = {
            border = "double",
        },
    }
)
