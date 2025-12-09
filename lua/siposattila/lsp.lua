local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.set_sign_icons({
    error = "✘",
    warn = "▲",
    hint = "⚑",
    info = "»"
})

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "gopls",
        "rust_analyzer",
        "harper_ls",
        "pyright"
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

vim.lsp.config("rust_analyzer", {
    on_attach = lsp_zero.on_attach,
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            check = {
                command = "clippy",
            },
        },
    },
})

require("mini.completion").setup({
    lsp_completion = {
        source_func = "omnifunc",
        auto_setup = false
    },
    mappings = {
        force_twostep = "",
        force_fallback = "",
        scroll_down = "",
        scroll_up = "",
    },
})

local on_attach = function(args)
    vim.bo[args.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
end
vim.api.nvim_create_autocmd("LspAttach", { callback = on_attach })

local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
    snippets = { gen_loader.from_lang() }
})
MiniSnippets.start_lsp_server()

require("mini.icons").setup()
MiniIcons.tweak_lsp_kind()

require("mini.surround").setup()
