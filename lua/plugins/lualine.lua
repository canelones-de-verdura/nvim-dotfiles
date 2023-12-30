return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local latte = require("catppuccin.palettes").get_palette "latte"
        local tema = {
            normal = {
                a = { fg = latte.lavender,  bg = latte.mantle,  gui = 'bold' },
                b = { fg = latte.text,      bg = latte.mantle,  gui = 'italic' },
                c = { fg = latte.text,      bg = latte.mantle,  gui = 'italic' },
            },
            insert = {
                a = { fg = latte.green,     bg = latte.mantle,  gui = 'bold' }
            },
            command = {
                a = { fg = latte.flamingo,  bg = latte.mantle,  gui = 'bold' }
            },
            replace = {
                a = { fg = latte.flamingo,  bg = latte.mantle,  gui = 'bold' }
            },
            visual = {
                a = { fg = latte.maroon,    bg = latte.mantle,  gui = 'bold' }
            },
        }

        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = tema,
                component_separators = { left = '•', right = '•' },
                section_separators = { left = '', right = '' },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        icons_enabled = true,
                        icon = '🧉',
                    }
                },
                lualine_b = {
                    {
                        'filename',
                        file_status = true,
                        path = 0,
                        shorting_target = 40,
                        symbols = {
                            modified = '[+]',
                            readonly = '[-]',
                            unnamed = '[No Name]',
                            newfile = '[New]',
                        },
                    },
                    {
                        'branch'
                    },
                    {
                        'diff'
                    }
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {'diagnostics','filetype','progress','location'},
                lualine_z = {},
            },
        }
    end,
}
