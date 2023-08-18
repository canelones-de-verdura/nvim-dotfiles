return {
    "folke/zen-mode.nvim",
    opts = {
        -- Bindeo el plugin antes que nada
        vim.keymap.set('n', '<leader>z', vim.cmd.ZenMode),
        window = {
            backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
            -- height and width can be:
            -- * an absolute number of cells when > 1
            -- * a percentage of the width / height of the editor when <= 1
            -- * a function that returns the width or the height
            width = 82, -- width of the Zen window
            height = 0.9, -- height of the Zen window
            -- by default, no options are changed for the Zen window
            -- uncomment any of the options below, or add other vim.wo options you want to apply
            options = {
                signcolumn = "yes", -- disable signcolumn
                number = false, -- disable number column
                relativenumber = false, -- disable relative numbers
              -- cursorline = false, -- disable cursorline
              -- cursorcolumn = false, -- disable cursor column
              -- foldcolumn = "0", -- disable fold column
              -- list = false, -- disable whitespace characters
            },
        },
        plugins = {
            -- disable some global vim options (vim.o...)
            -- comment the lines to not apply the options
            options = {
                enabled = true,
                ruler = false, -- disables the ruler text in the cmd line area
                showcmd = false, -- disables the command in the last line of the screen
                colorcolumn = "0"
            },
        },
        -- callback where you can add custom code when the Zen window opens
        on_open = function(win)
            vim.diagnostic.config({
                virtual_text = false, -- Turn off inline diagnostics
            })
        end,
        -- callback where you can add custom code when the Zen window closes
        on_close = function()
            vim.diagnostic.config({
                virtual_text = true, -- Turn off inline diagnostics
            })
        end,
    }
}
