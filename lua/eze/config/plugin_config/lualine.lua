local colores = {
  verde = '#40a02b',
  celeste = '#7287fd',
  negro = '#4c4f69',
  blanco = '#eff1f5',
  naranja = '#dd7878',
  rojo = '#e64553',
  gris = '#ccd0da',
  gris_oscuro = '#7c7f93',
}

local tema = {
  normal = {
    a = { fg = colores.blanco, bg = colores.celeste, gui = 'bold' },
    b = { fg = colores.gris_oscuro, bg = colores.gris },
    c = { fg = colores.negro, bg = colores.blanco},
  },

  insert = { a = { fg = colores.blanco, bg = colores.verde, gui = 'bold' } },
  command = { a = { fg = colores.blanco, bg = colores.naranja, gui = 'bold' } },
  replace = { a = { fg = colores.blanco, bg = colores.naranja, gui = 'bold' } },
  visual = { a = { fg = colores.blanco, bg = colores.rojo, gui = 'bold' } },

  inactive = {
    a = { fg = colores.gris_oscuro, bg = colores.gris },
    b = { fg = colores.gris_oscuro, bg = colores.blanco },
    c = { fg = colores.gris_oscuro, bg = colores.blanco },
  },
}

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = tema,
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
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
                separator = { left = ' ' },
                padding = 1,
            }
        },
        lualine_b = {'filename', 'branch', 'diff'},
        lualine_c = {},
        lualine_x = {'diagnostics'},
        lualine_y = {'filetype', 'progress'},
        lualine_z = {
            {
                'location',
                separator = { right = ' ' },
                padding = 1,
            }
        },
    },
    inactive_sections = {
        lualine_a = {
            {
                'filename',
                separator = { left = ' ', right = '' },
                padding = 1,
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},

    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {'fzf'}
}
