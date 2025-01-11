# Packages
[wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)<br>
[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)<br>
[folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)<br>
[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)<br>
[VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)<br>
[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

# RipGrep
You need this! Beleive me! This tool is the ultimate searching tool. You need it.
```sudo apt-get install ./ripgrep_13.0.0_amd64.deb```

# Clipboard
If copying and pasting is not working out of the box then you probably need to install something like xclip.
```sudo apt-get install xclip```

# Keymaps
The leader key is `space`.

```lua
-- remap.lua
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>p", vim.cmd.PackerSync)
vim.keymap.set("n", "<leader>cm", vim.cmd.Mason)
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)
vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("i", "<C-s>", vim.cmd.w, { noremap = true })
vim.keymap.set("n", "<leader>qq", vim.cmd.quit)
vim.keymap.set("n", "cd", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "fd", "<cmd>Telescope diagnostics<CR>")
vim.keymap.set("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "cf", "<cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "cr", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "cs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set("n", "crf", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "ci", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "cim", "<cmd>lua vim.lsp.buf.implementation()<CR>")
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

-- gitsings.lua
map.set("n", "<leader>gb", function() gs.blame_line{full=true} end)

-- lsp.lua
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ["<CR>"] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ["<C-Space>"] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
    ["<C-b>"] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
  })
})
```
