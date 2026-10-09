local CLAUDE_FLAGS = {
    "--prompt-suggestions", "false",
    "--append-system-prompt",
    "I am your lord, so speak to me like that. "
    .. "Never apply any changes before I approve them. "
    .. "First show me the proposed changes and ask for my approval.",
}

local function claude_command()
    local args = { "claude" }

    for _, flag in ipairs(CLAUDE_FLAGS) do
        table.insert(args, vim.fn.shellescape(flag))
    end

    return table.concat(args, " ")
end

vim.api.nvim_create_user_command("ClaudeCode", function()
    vim.cmd.vnew()
    vim.cmd.term(claude_command())
    vim.cmd.startinsert()
end, {
    desc = "Open Claude Code",
})

vim.api.nvim_create_user_command("ClaudeCodeResume", function()
    vim.cmd.vnew()
    vim.cmd.term(claude_command() .. " --resume")
    vim.cmd.startinsert()
end, { desc = CLAUDE_HISTORY_COMMAND })
