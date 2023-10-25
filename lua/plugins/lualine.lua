return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local colores = {
            celeste = '#7287fd',
            gris = '#e6e9ef',
            naranja = '#dd7878',
            negro = '#4c4f69',
            rojo = '#e64553',
            verde = '#40a02b',
        }

        local tema = {
            normal = {
                a = { fg = colores.celeste, bg = colores.gris, gui = 'bold' },
                b = { fg = colores.negro, bg = colores.gris, gui = 'italic' },
                c = { fg = colores.negro, bg = colores.gris, gui = 'italic'},
            },

            insert = {
                a = { fg = colores.verde, bg = colores.gris, gui = 'bold' }
            },

            command = {
                a = { fg = colores.naranja, bg = colores.gris, gui = 'bold' }
            },

            replace = {
                a = { fg = colores.naranja, bg = colores.gris, gui = 'bold' }
            },

            visual = {
                a = { fg = colores.rojo, bg = colores.gris, gui = 'bold' }
            },
        }

        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = tema,
                component_separators = { left = '•', right = '•'},
                section_separators = { left = '', right = ''},
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
                        'branch'
                    },
                    {
                        'diff'
                    },
                    {
                        'buffers',
                        max_length = vim.o.columns * 2 / 3,
                        buffers_color = {
                            active = {
                                fg = colores.negro,
                                bg = colores.gris,
                                gui='italic,bold'
                            },
                            inactive = {
                                fg = colores.negro,
                                bg = colores.gris,
                                gui='italic'
                            },
                        },
                        symbols = {
                            modified = ' 🖉 ',
                            alternate_file = '',
                            directory =  '',
                      },
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
