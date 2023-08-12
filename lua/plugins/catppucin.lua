-- mejor colorscheme que vi en mi vida.
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup {
            flavour = "latte"
        }
        vim.cmd.colorscheme "catppuccin"
    end,
}
