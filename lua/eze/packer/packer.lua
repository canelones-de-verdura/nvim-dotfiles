-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colores (catppuccin/nvim)
  use { "catppuccin/nvim", as = "catppuccin"}

  -- indent-blankline.nvim
  use {"lukas-reineke/indent-blankline.nvim", as = "indent_blankline"}

  -- treesitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

end)
