local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

execute "packadd packer.nvim"

return require("packer").startup(function(use)
    use ("wbthomason/packer.nvim")
    use ({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" }})
    use ("folke/tokyonight.nvim")
    use ("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use ({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            {
                "nvim-mini/mini.nvim",
                version = "*",
                requires = { "rafamadriz/friendly-snippets" }
            },
        }
    })

    use ({
        "mfussenegger/nvim-dap",
        requires = {
            "leoluz/nvim-dap-go",
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = require("siposattila.dap")
    })

    -- git
    use "lewis6991/gitsigns.nvim"
    use({
        "kdheepak/lazygit.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })

    -- comments highlight
    use({
        "folke/todo-comments.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function() require("todo-comments").setup() end
    })
end)
