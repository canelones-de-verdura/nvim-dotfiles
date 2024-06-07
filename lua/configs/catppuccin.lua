require("catppuccin").setup {
    flavour = "latte",
    -- Cambio el color de los recuadros, folds, etc
    custom_highlights = function(colors)
        return {
            netrwTreeBar = {fg = colors.overlay0 },
            FloatBorder = { fg = colors.overlay0 },
            Folded = { fg = colors.overlay0, bg = colors.base }
        }
    end,
    integrations = {
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
        nvimtree = true,
    },
}
vim.cmd.colorscheme "catppuccin"
