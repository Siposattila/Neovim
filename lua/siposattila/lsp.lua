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
require("mason-tool-installer").setup({
    ensure_installed = {
        -- LSP
        "gopls",
        "rust_analyzer",
        "harper_ls",
        "pyright",
        "jsonls",
        "vtsls",
        "vue_ls",

        -- Linter
        "ruff",

        -- Formatter
        "black",
    },
    auto_update = false,
    run_on_start = true,
})
require("mason-lspconfig").setup({
    handlers = {
        lsp_zero.default_setup,
    },
})

vim.lsp.config("rust_analyzer", {
    on_attach = lsp_zero.on_attach,
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
        },
    },
})

local mason_path = vim.fn.stdpath("data") .. "/mason/packages"
local vue_ls_path = mason_path .. "/vue-language-server/node_modules/@vue/language-server"
local vue_ts_plugin = vue_ls_path .. "/node_modules/@vue/typescript-plugin"

vim.lsp.config("vtsls", {
    filetypes = {
        "vue",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx"
    },
    root_markers = {
        "tsconfig.json",
        "package.json",
        "jsconfig.json",
        ".git"
    },
    settings = {
      vtsls = {
        enableMoveToFileCodeAction = true,
        tsserver = {
          globalPlugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_ts_plugin,
                languages = { "vue" },
                configNamespace = "typescript",
                enableForWorkspaceTypeScriptVersions = true,
            }
          }
        }
      },
      typescript = {
          preferences = {
              importModuleSpecifier = "non-relative",
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                  completeFunctionCalls = true,
              },
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
