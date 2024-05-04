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
            require("nvim-treesitter.configs").setup {
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            }
        end,
    },

    -- Íconos
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },

    -- Git
    {
        "tpope/vim-fugitive",
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            -- Cambio solo el borde de los popups, de rompe bolas nomás
            require('gitsigns').setup {
                preview_config = { border = 'rounded' }
            }
            -- Binds
            vim.keymap.set('n', '<leader>gb',
                ":Gitsigns toggle_current_line_blame<CR>")
            vim.keymap.set('n', '<leader>gp',
                ":Gitsigns preview_hunk<CR>")
        end,
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            -- Dejo la config predeterminada
            require("telescope").setup {}
            -- Bind "global", para poder buscar entre todas las opciones
            vim.keymap.set('n', '<leader>t', ':Telescope<CR>')
            -- Binds específicas
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>f', builtin.find_files, {})
            vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>b', builtin.buffers, {})
            vim.keymap.set('n', '<leader>h', builtin.oldfiles, {})
            vim.keymap.set('n', '<leader>d', builtin.diagnostics, {})
            vim.keymap.set('n', '<leader>?', builtin.help_tags, {})
        end,
    },

    -- LSP, autocomplete
    {
        "williamboman/mason.nvim",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        -- Completado de palabras, rutas de archivos
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            require "configs.cmp"
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        -- Completado de LSP
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            require "configs.lspconfig"
        end,
    },
}
