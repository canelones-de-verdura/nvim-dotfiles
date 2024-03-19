require("catppuccin").setup {
    flavour = "latte",
    -- Cambio el color de los recuadros
    custom_highlights = function(colors)
        return {
            FloatBorder = { fg = colors.overlay0 },
            Folded = { fg = colors.overlay0, bg = colors.base }
        }
    end,
    integrations = {
        alpha = true,
        cmp = true,
        treesitter = true,
        mason = true,
        markdown = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },
        telescope = {
            enabled = true,
        },
    },
}
vim.cmd.colorscheme "catppuccin"
