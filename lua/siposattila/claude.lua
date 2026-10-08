local CLAUDE_COMMAND = "claude"

-- Claude CLI open claude
vim.api.nvim_create_user_command("ClaudeCode", function()
    vim.cmd.vnew()
    vim.cmd.term(CLAUDE_COMMAND)
end, { desc = CLAUDE_COMMAND })

local CLAUDE_HISTORY_COMMAND = CLAUDE_COMMAND .. " --resume"

-- Claude CLI open history
vim.api.nvim_create_user_command("ClaudeCodeResume", function()
    vim.cmd.vnew()
    vim.cmd.term(CLAUDE_HISTORY_COMMAND)
end, { desc = CLAUDE_HISTORY_COMMAND })
