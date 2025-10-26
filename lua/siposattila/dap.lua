return function()
    local dap = require("dap")
    local ui = require("dapui")

    ui.setup()
    require("nvim-dap-virtual-text").setup()

    -- Go debugging setup with dlv
    require("dap-go").setup()

    dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-dap",
        name = "lldb"
    }

    dap.configurations.rust = {
        {
            name = "Debug Rust (config)",
            type = "lldb",
            request = "launch",
            program = function()
                print("🔧 Building project...")
                vim.fn.system("cargo build")
                print("🚀 Build is ready!")

                return vim.fn.getcwd() .. "/target/debug/" .. vim.fn.getcwd():match("([^/]+)$")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
        },
    }

    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    -- vim.keymap.set("n", "", dap.run_to_cursor)

    -- Eval var under cursor
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
