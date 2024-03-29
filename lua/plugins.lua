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
        config = function ()
            require "configs.treesitter"
        end,
    },

    -- Íconos
    {
        "nvim-tree/nvim-web-devicons",
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
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require "configs.telescope"
        end,
    },

    -- Soporte de lenguajes
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v3.x',
        dependencies = {
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},
            {"neovim/nvim-lspconfig"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/nvim-cmp"},
            {"L3MON4D3/LuaSnip"},
            {"onsails/lspkind.nvim"},
        },
        config = function()
            require "configs.lsp-zero"
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        config = function ()
            require "configs.nvim-lint"
        end
    },

}
