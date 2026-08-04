-- Using Escape to exit Terminal mode
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = false })

-- local job_id = nil

vim.keymap.set("n", "<leader>st", function()
    vim.cmd.vnew()                     -- Open a new virtual window
    vim.cmd.term()                     -- Run terminal
    vim.cmd.wincmd("J")                -- Put terminal to the bottom
    vim.api.nvim_win_set_height(0, 15) -- Set height to 15 lines

    --    job_id = vim.bo.channel
end)

-- For custom terminal short cuts example
-- vim.keymap.set("n", "<leader>example", function()
--     if job_id then
--         vim.fn.chansend(job_id, { "ls -al\r\n" })
--     end
-- end)
