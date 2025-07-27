--[[ Config ]]
-- Título de la terminal
vim.opt.title = false

-- Números de línea
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "auto"
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.colorcolumn = "0"

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
vim.opt.background = "dark"

-- Status line
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.showtabline = 1
vim.opt.showmode = true

-- Folds
vim.opt.fillchars = { fold = " " }
vim.opt.foldtext = ""
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- por default
vim.api.nvim_create_autocmd('LspAttach', {         -- si se puede usamos lsp
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client:supports_method('textDocument/foldingRange') then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
    end,
})

vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "0"

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Completion menu
vim.opt.completeopt = "menu,menuone,popup"
vim.opt.pumblend = 15 -- Transparencia

-- Varios
vim.opt.updatetime = 50

-- highlight cuando copiamos
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})

--[[ Binds ]]
-- Leader key
vim.g.mapleader = " "

-- Esc
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")

-- Borro el resaltado de búsqueda con esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Me muevo entre buffers
vim.keymap.set("n", "<Tab>", vim.cmd.bn)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bp)

-- Ventanas
vim.keymap.set("n", "<M-+>", "<C-w>+")
vim.keymap.set("n", "<M-->", "<C-w>-")
vim.keymap.set("n", "<M-<>", "<C-w><")
vim.keymap.set("n", "<M->>", "<C-w>>")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-l>", "<C-w>l")
vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-K>", "<C-w>K")
vim.keymap.set("n", "<M-J>", "<C-w>J")
vim.keymap.set("n", "<M-L>", "<C-w>L")
vim.keymap.set("n", "<M-H>", "<C-w>H")

-- Cierro buffers
vim.keymap.set("n", "<leader>c", vim.cmd.bd)

-- Mueven lo que esté seleccionado
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Centran la vista mientras me desplazo
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Me muevo en quickfix
vim.keymap.set("n", "<M-n>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-p>", "<cmd>cprev<CR>")

-- Reemplaza la palabra bajo el cursor en todo el documento
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Jump in snippet
vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
    if vim.snippet.active({ direction = 1 }) then
        return "<cmd>lua vim.snippet.jump(-1)<cr>"
    else
        return "<S-Tab>"
    end
end, { expr = true })

-- Y para el otro lado
vim.keymap.set({ "i", "s" }, "<Tab>", function()
    if vim.snippet.active({ direction = 1 }) then
        return "<cmd>lua vim.snippet.jump(1)<cr>"
    else
        return "<Tab>"
    end
end, { expr = true })


--[[ Statusline ]]
-- Cosas de Git
local gitbranch = function()
    local branch = vim.b.gitsigns_head
    if not branch then
        return ""
    end

    return "·  " .. branch
end

local gitstatus = function()
    local status = vim.b.gitsigns_status
    if not status or status == "" then
        return ""
    end

    return " : " .. status
end

-- Lenguajes/LSP
local level = vim.diagnostic.severity

local diagnostics = function()
    local error = #vim.diagnostic.get(0, { severity = level.ERROR })
    local warn = #vim.diagnostic.get(0, { severity = level.WARN })
    local hint = #vim.diagnostic.get(0, { severity = level.HINT })
    local info = #vim.diagnostic.get(0, { severity = level.INFO })

    local diagnostic = "" -- Lo que voy a devolver
    if error and error ~= 0 then
        diagnostic = diagnostic .. " 󰅚 " .. error
    end

    if warn and warn ~= 0 then
        diagnostic = diagnostic .. " 󰀪 " .. warn
    end

    if hint and hint ~= 0 then
        diagnostic = diagnostic .. " 󰌶 " .. hint
    end

    if info and info ~= 0 then
        diagnostic = diagnostic .. "  " .. info
    end

    if diagnostic ~= "" then
        return " :" .. diagnostic
    end

    return diagnostic
end

-- Funciones Globales
function Git()
    return gitbranch() .. gitstatus()
end

function FileInfo()
    local ft = vim.bo.filetype
    if ft ~= "" then
        return "󰣖 " .. ft .. diagnostics() .. " ·"
    end

    return ft
end

-- Armamos todo
local statusline = {
    -- "%#Normal#",
    " %t%r%m",
    " %{%v:lua.Git()%} ",
    "%=", -- Mitad
    " %{%v:lua.FileInfo()%} ",
    "󰦪 Ln %l, Col %c : %P %<",
}

vim.o.statusline = table.concat(statusline)

--[[ Instalamos Lazy para administrar paquetes ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

--[[ Adjunto plugins ]]
require("lazy").setup({
    ui = { border = "rounded" },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = false },
    rocks = { enabled = false },
    spec = {
        -- Colores
        {
            "sainnhe/sonokai",
            priority = 1000,
            config = function()
                vim.cmd("let g:sonokai_better_performance = 1")
                vim.cmd("let g:sonokai_enable_italic = 1")
                vim.cmd("colorscheme sonokai")
            end
        },
        -- {
        --     "catppuccin/nvim",
        --     name = "catppuccin",
        --     priority = 1000,
        --     config = function()
        --         require("catppuccin").setup({
        --             flavour = "frappe",
        --         })
        --        vim.cmd.colorscheme "catppuccin"
        --     end
        -- },
        -- {
        --     "sainnhe/everforest",
        --     priority = 100,
        --     config = function()
        --         vim.cmd.colorscheme "everforest"
        --     end
        -- },

        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                require("nvim-treesitter.configs").setup {
                    auto_install = true,
                    highlight = { enable = true },
                    indent = { enable = true },
                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            -- incremental selection works from normal select mode
                            node_incremental = "L",
                            node_decremental = "H",
                        }
                    },
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
                vim.keymap.set('n', '<leader>gb', ":Gitsigns toggle_current_line_blame<CR>")
                vim.keymap.set('n', '<leader>gp', ":Gitsigns preview_hunk<CR>")
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

        -- Nvim-Tree
        {
            "nvim-tree/nvim-tree.lua",
            config = function()
                require("nvim-tree").setup({
                    view = { width = 30, side = "right" },
                    diagnostics = { enable = true },
                })
                vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
                vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
                vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
                vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
            end,
        },

        -- LSP, autocomplete
        {
            "rafamadriz/friendly-snippets",
            -- lazy = true,
        },

        {
            "saghen/blink.cmp",
            version = "*",
            opts = {
                keymap = { preset = "default" },

                appearance = {
                    use_nvim_cmp_as_default = true,
                    nerd_font_variant = "mono"
                },

                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                },
            },
            opts_extend = { "sources.default" }
        },

        {
            "williamboman/mason.nvim",
            dependencies = { "williamboman/mason-lspconfig.nvim" },
            config = function()
                require("mason").setup({
                    ui = { border = "rounded" }
                })
                require("mason-lspconfig").setup()
            end,
        },

        {
            "neovim/nvim-lspconfig",
            dependencies = {
                -- más que nada para asegurarnos de que cargue todo antes de llegar acá
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "saghen/blink.cmp"
            },
            config = function()
                -- Keybinds, etc. Cosas específicas de lspconfig
                -- Use LspAttach autocommand to only map the following keys
                -- after the language server attaches to the current buffer
                vim.api.nvim_create_autocmd("LspAttach", {
                    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                    callback = function(ev)
                        -- Inlay hints
                        vim.lsp.inlay_hint.enable()

                        -- Configuración de diagnósticos
                        vim.diagnostic.config({
                            virtual_lines = true,
                            underline = true,
                            update_in_insert = false,
                            severity_sort = true,
                            signs = {
                                -- Coloreamos el número de línea, pero sin íconos
                                text = {
                                    [vim.diagnostic.severity.ERROR] = '',
                                    [vim.diagnostic.severity.WARN] = '',
                                    [vim.diagnostic.severity.INFO] = '',
                                    [vim.diagnostic.severity.HINT] = '',
                                },
                                linehl = {
                                    [vim.diagnostic.severity.ERROR] = 'Error',
                                    [vim.diagnostic.severity.WARN] = 'Warning',
                                    [vim.diagnostic.severity.INFO] = 'Info',
                                    [vim.diagnostic.severity.HINT] = 'Hint',
                                },
                                numhl = {
                                    [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
                                    [vim.diagnostic.severity.WARN] = 'WarningMsg',
                                    [vim.diagnostic.severity.INFO] = 'InfoMsg',
                                    [vim.diagnostic.severity.HINT] = 'HintMsg',
                                },
                            },
                        })

                        -- Binds personalizadas
                        local opts = { buffer = ev.buf }
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
                        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                        vim.keymap.set({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, opts)
                        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
                        vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
                        vim.keymap.set({ "n", "x" }, "<F3>", function()
                            vim.lsp.buf.format { async = true }
                        end, opts)
                    end,
                })

                -- Integramos con blink
                local capabilities = require('blink.cmp').get_lsp_capabilities()
                vim.lsp.config("*", { capabilities = capabilities })

                -- Configs específicas
                vim.lsp.config("pyright", {
                    settings = {
                        pyright = {
                            disableOrganizeImports = true,
                        },
                        python = {
                            analysis = {
                                typeCheckingMode = "off",
                                ignore = { '*' },
                            },
                        },
                    },
                })
            end,
        },
    },
})
