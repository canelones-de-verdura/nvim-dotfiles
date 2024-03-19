local lint = require("lint")

-- Selecciono los linter que quiero usar. Hay que instalarlos por Mason
lint.linters_by_ft = {}

-- Para activar el linter de forma automática
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()
        lint.try_lint()
    end,
})

-- Para activar de forma manual
vim.keymap.set("n", "<leader>l", function()
    lint.try_lint()
end, { desc = "Trigger linting for current file" })
