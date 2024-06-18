--[[ Statusline ]]
-- Cosas de Git
local gitbranch = function()
    local branch = vim.b.gitsigns_head
    if not branch then
        return ""
    end

    return "·  " .. branch
end

local gitstatus = function()
    local status = vim.b.gitsigns_status
    if not status or status == "" then
        return ""
    end

    return " : " .. status
end

-- Lenguajes/LSP
local level = vim.diagnostic.severity

local diagnostics = function()
    local error = #vim.diagnostic.get(0, { severity = level.ERROR })
    local warn = #vim.diagnostic.get(0, { severity = level.WARN })
    local hint = #vim.diagnostic.get(0, { severity = level.HINT })
    local info = #vim.diagnostic.get(0, { severity = level.INFO })

    local diagnostic = "" -- Lo que voy a devolver
    if error and error ~= 0 then
        diagnostic = diagnostic .. " 󰅚 " .. error
    end

    if warn and warn ~= 0 then
        diagnostic = diagnostic .. " 󰀪 " .. warn
    end

    if hint and hint ~= 0 then
        diagnostic = diagnostic .. " 󰌶 " .. hint
    end

    if info and info ~= 0 then
        diagnostic = diagnostic .. "  " .. info
    end

    if diagnostic ~= "" then
        return " :" .. diagnostic
    end

    return diagnostic
end

-- Funciones Globales
function Git()
    return gitbranch() .. gitstatus()
end

function FileInfo()
    local ft = vim.bo.filetype
    if ft ~= "" then
        return "󰣖 "..ft .. diagnostics() .. " ·"
    end

    return ft
end

-- Armamos todo
local statusline = {
    " %t%r%m",
    " %{%v:lua.Git()%} ",
    "%=", -- Mitad
    " %{%v:lua.FileInfo()%} ",
    "󰦪 Ln %l, Col %c : %P %<",
}

vim.o.statusline = table.concat(statusline)
