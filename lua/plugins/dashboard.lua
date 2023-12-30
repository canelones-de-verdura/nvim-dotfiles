return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
            "  ███▄    █  ▓█████ ▒█████   ██▒   █▓  ██▓ ███▄ ▄███▓ ",
            "  ██ ▀█   █  ▓█   ▀▒██▒  ██▒▓██░   █▒▒▓██▒▓██▒▀█▀ ██▒ ",
            " ▓██  ▀█ ██▒ ▒███  ▒██░  ██▒ ▓██  █▒░▒▒██▒▓██    ▓██░ ",
            " ▓██▒  ▐▌██▒ ▒▓█  ▄▒██   ██░  ▒██ █░░░░██░▒██    ▒██  ",
            " ▒██░   ▓██░▒░▒████░ ████▓▒░   ▒▀█░  ░░██░▒██▒   ░██▒ ",
            " ░ ▒░   ▒ ▒ ░░░ ▒░ ░ ▒░▒░▒░    ░ ▐░   ░▓  ░ ▒░   ░  ░ ",
            " ░ ░░   ░ ▒░░ ░ ░    ░ ▒ ▒░    ░ ░░  ░ ▒ ░░  ░      ░ ",
            "    ░   ░ ░     ░  ░ ░ ░ ▒        ░  ░ ▒ ░░      ░    ",
            "          ░ ░   ░      ░ ░        ░    ░         ░    ",
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button( "n", "📄 > Nuevo"     , ":ene <BAR> startinsert <CR>"),
            dashboard.button( "f", "🔎 > Buscar"    , ":Telescope find_files<CR>"),
            dashboard.button( "e", "📁 > Explorar"  , ":Ex<CR>"),
            dashboard.button( "h", "📂 > Recientes" , ":Telescope oldfiles<CR>"),
            dashboard.button( "l", "💤 > Lazy"      , ":Lazy<CR>"),
            dashboard.button( "m", "⚒️  > Mason"     , ":Mason<CR>"),
            dashboard.button( "q", "💨 > Salir"     , ":q!<CR>"),
        }

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
    end
}
