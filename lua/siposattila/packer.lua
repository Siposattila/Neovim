local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

execute "packadd packer.nvim"

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.8",
        -- or branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    use "folke/tokyonight.nvim"

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- LSP Support
            { "neovim/nvim-lspconfig" },
            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
        }
    }

    -- Git
    use "lewis6991/gitsigns.nvim"
    use({
        "kdheepak/lazygit.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
end)
