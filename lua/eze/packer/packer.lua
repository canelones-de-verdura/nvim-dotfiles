-- This file can be loaded by calling `lua require('plugins')`
-- from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { 
        "catppuccin/nvim",
        as = "catppuccin"
    }
    use(
        'nvim-treesitter/nvim-treesitter',
        {run = ':TSUpdate'}
    )
    use "lukas-reineke/indent-blankline.nvim"
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
  
end)
