-- Using Escape to exit Terminal mode
vim.api.nvim_set_keymap("t", "<C-n>", "<C-\\><C-n>", { noremap = true, silent = false })

local TERMINAL_PLACE = "J" -- Put terminal to the bottom
local TERMINAL_HEIGHT = 15 -- Set height to 15 lines

-- local job_id = nil

vim.keymap.set("n", "<leader>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd(TERMINAL_PLACE)
    vim.api.nvim_win_set_height(0, TERMINAL_HEIGHT)

    -- job_id = vim.bo.channel
end)
