local CLINE_COMMAND = "cline"

-- Cline CLI open cline
vim.api.nvim_create_user_command("Cline", function()
    vim.cmd.vnew()
    vim.cmd.term(CLINE_COMMAND)
end, { desc = CLINE_COMMAND })

local CLINE_HISTORY_COMMAND = CLINE_COMMAND .. " history"

-- Cline CLI open history
vim.api.nvim_create_user_command("ClineHistory", function()
    vim.cmd.vnew()
    vim.cmd.term(CLINE_HISTORY_COMMAND)
end, { desc = CLINE_HISTORY_COMMAND })
