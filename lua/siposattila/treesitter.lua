return function()
    require("nvim-treesitter").setup()

    require("nvim-treesitter").install({
        "lua",
        "vim",
        "vimdoc",
        "python",
        "go",
        "rust",
    })

    vim.api.nvim_create_autocmd("FileType", {
        pattern = {
            "lua",
            "vim",
            "vimdoc",
            "python",
            "go",
            "rust",
        },
        callback = function()
            vim.treesitter.start()
        end,
    })
end
