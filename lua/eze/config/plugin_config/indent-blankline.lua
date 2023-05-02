-- indent-blankline.nvim
require("indent_blankline").setup {
    char = '┊',
    blankline = '┊',
    --Preciso treesitter para que funquen las dos de abajo
    show_current_context = true,
    show_current_context_start = true,
}

