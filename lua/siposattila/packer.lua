local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

execute "packadd packer.nvim"

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use ({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" }
    })

    use "folke/tokyonight.nvim"

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- LSP Support
            "neovim/nvim-lspconfig",
            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        }
    }

    use {
        "mfussenegger/nvim-dap",
        requires = {
            "leoluz/nvim-dap-go",
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap = require("dap")
            local ui = require("dapui")

            require("dapui").setup()
            require("dap-go").setup()
            require("nvim-dap-virtual-text").setup()

            vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

            -- Eval var under cursor
            vim.keymap.set("n", "<space>?", function()
              require("dapui").eval(nil, { enter = true })
            end)

            vim.keymap.set("n", "<F1>", dap.continue)
            vim.keymap.set("n", "<F2>", dap.step_into)
            vim.keymap.set("n", "<F3>", dap.step_over)
            vim.keymap.set("n", "<F4>", dap.step_out)
            vim.keymap.set("n", "<F5>", dap.step_back)
            vim.keymap.set("n", "<F12>", dap.restart)

            dap.listeners.before.attach.dapui_config = function()
              ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
              ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
              ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
              ui.close()
            end
        end
    }

    -- Git
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
