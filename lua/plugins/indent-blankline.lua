return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("indent_blankline").setup {
            strict_tabs = true,
            char = '┊',
            context_char = '┊',
            show_current_context = true,
            show_current_context_start = true,
        }
    end,
}
