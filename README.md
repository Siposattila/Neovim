# Packages
[wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)<br>
[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)<br>
[folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)<br>
[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)<br>
[VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)<br>
[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)<br>
[kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)<br>
[folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)<br>
[mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)<br>
[leoluz/nvim-dap-go](https://github.com/leoluz/nvim-dap-go)<br>
[rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)<br>
[theHamsta/nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)<br>
[rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)<br>
[nvim-mini/mini.nvim](https://github.com/nvim-mini/mini.nvim)

# RipGrep
You need to have ripgrep on your system.

# Clipboard
You will need some type of clipboard manager.

# Keymaps
The leader key is `space`.

```lua
-- remap.lua
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>p", vim.cmd.PackerSync)
vim.keymap.set("n", "<leader>cm", vim.cmd.Mason)
vim.keymap.set("n", "<leader>gg", vim.cmd.LazyGit)
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)
vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("i", "<C-s>", vim.cmd.w, { noremap = true })
vim.keymap.set("n", "<leader>qq", vim.cmd.quitall)
vim.keymap.set("n", "cd", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "fd", "<cmd>Telescope diagnostics<CR>")
vim.keymap.set("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "cf", "<cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "cr", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "cs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set("n", "crf", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "ch", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "gdf", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "ci", "<cmd>lua vim.lsp.buf.implementation()<CR>")
vim.keymap.set("n", "gtd", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==")
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv")

-- telescope.lua
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>fs", builtin.treesitter, {})

-- this needs todo comments to be installed :3
vim.keymap.set("n", "<leader>ft", vim.cmd.TodoTelescope, {})

-- gitsings.lua
map.set("n", "<leader>gb", function() gs.blame_line{full=true} end)

-- dap.lua
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)

vim.keymap.set("n", "<leader>?", function()
  require("dapui").eval(nil, { enter = true })
end)

vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F12>", dap.restart)
vim.keymap.set("n", "<C-b>", ui.toggle)

-- mini.surround
mappings = {
    add = 'sa', -- Add surrounding in Normal and Visual modes
    delete = 'sd', -- Delete surrounding
    find = 'sf', -- Find surrounding (to the right)
    find_left = 'sF', -- Find surrounding (to the left)
    highlight = 'sh', -- Highlight surrounding
    replace = 'sr', -- Replace surrounding

    suffix_last = 'l', -- Suffix to search with "prev" method
    suffix_next = 'n', -- Suffix to search with "next" method
}
```
