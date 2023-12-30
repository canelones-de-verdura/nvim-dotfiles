-- lazy.nvim como administrador de paquetes.
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

-- NO CAMBIAR DE LUGAR: la documentación dice que hay que mapear <leader>
-- antes de mechar los plugins. andá a saber por qué.
vim.g.mapleader = " "

-- adjunto la carpeta donde van a ir los plugins. no quiero un archivo de 500
-- líneas.
require("lazy").setup(
    "plugins",
    {
        ui = {
            border = "double",
        },
    }
)

-- adjunto configuración personal.
require("eze.config")
