-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Inlay hints
        vim.lsp.inlay_hint.enable()

        -- Íconos en los diagnósticos
        local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        -- Redondito en los diagnósticos
        vim.diagnostic.config({ virtual_text = { prefix = " ●" } })

        -- Binds personalizadas
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        -- La predeterminada funca solo en insert
        vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, opts)
        -- Formateo para todo el archivo. Para selecciones, usar gq
        vim.keymap.set("n", "<F3>", function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

-- Configuramos los servers para usar cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            capabilities = capabilities,
        }
    end,
}
