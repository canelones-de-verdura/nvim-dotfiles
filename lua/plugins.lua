return {
    -- Colores
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require "configs.catppuccin"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "configs.treesitter"
        end,
    },

    -- Íconos
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require "configs.lualine"
        end,
    },

    -- Git
    {
        "tpope/vim-fugitive",
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require "configs.gitsigns"
        end,
    },

    -- Manipular archivos
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require "configs.telescope"
        end,
    },

    -- LSP
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require "configs.mason"
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require "configs.lspconfig"
        end,
    },
}
