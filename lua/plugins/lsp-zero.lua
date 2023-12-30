return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        {'L3MON4D3/LuaSnip'},
        {'onsails/lspkind.nvim'},
    },

    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({buffer = bufnr})
        end)
        -- Desactivo el resaltado de sintaxis
        lsp_zero.set_server_config({
            on_init = function(client)
                client.server_capabilities.semanticTokensProvider = nil
            end,
        })
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {},
            handlers = {
                lsp_zero.default_setup,
            },
        })

        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                 -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({select = true}),

                -- Ctrl+Space to trigger completion menu
                ['<C-Space>'] = cmp.mapping.complete(),

                -- Navigate between snippet placeholder
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),

                -- Scroll up and down in the completion documentation
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),

                -- Selecciono opciones del menú
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                fields = {'abbr', 'kind', 'menu'},
                format = require('lspkind').cmp_format({
                    -- show only symbol annotations
                    mode = 'symbol_text',
                    -- prevent the popup from showing more than provided
                    -- characters
                    maxwidth = 50,
                    -- when popup menu exceed maxwidth, the truncated part would
                    -- show ellipsis_char instead
                    ellipsis_char = '...',
                })
            }
        })
    end,
}
