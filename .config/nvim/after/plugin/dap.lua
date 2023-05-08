local dap = require('dap')
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-python').resolve_python = function()
    if os.getenv('CONDA_PREFIX') then
        return os.getenv('CONDA_PREFIX') .. '/bin/python'
    else
        return '$HOME/.virtualenvs/debugpy/bin/python3.9';
    end
end

vim.fn.sign_define("DapBreakpoint", {text = "⧐", texthl = "Error", linehl = "", numhl = ""})
vim.fn.sign_define("DapStopped", {text = "⧐", texthl = "Success", linehl = "", numhl = ""})

-- Nvim DAP Virtual Text
require("nvim-dap-virtual-text").setup()

local dapui = require('dapui')
dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

-- Nvim DAP UI
dapui.setup({
    icons = {expanded = "▾", collapsed = "▸"},
    mappings = {
        -- Use a table to apply multiple mappings
        expand = {"<CR>", "<2-LeftMouse>"},
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t"
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7"),
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                {id = "scopes", size = 0.25}, {id = "breakpoints", size = 0.25}, {id = "stacks", size = 0.25},
                {id = "watches", size = 0.25}
            },
            size = 60, -- 60 columns
            position = "left"
        }, {
            elements = {
                "repl"
                -- "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom"
        }
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {close = {"q", "<Esc>"}}
    },
    windows = {indent = 1},
    render = {
        max_type_length = nil -- Can be integer or nil.
    }
})

-- Enable type checking
require("neodev").setup({library = {plugins = {"nvim-dap-ui"}, types = true}})

local opt = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dB',
                        '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dE', '<cmd>lua require"dap".set_exception_breakpoints({"all"})<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua require("dap.breakpoints").clear()<CR>', opt)

vim.api.nvim_set_keymap('n', '<leader>dh', '<cmd>lua require"dap".step_out()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua require"dap".step_into()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dk', '<cmd>lua require"dap".step_back()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dj', '<cmd>lua require"dap".step_over()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua require"dap".continue()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dC', '<cmd>lua require"dap".run_to_cursor()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dq',
                        '<cmd>lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close();require"dapui".close()<CR>',
                        opt)

vim.api.nvim_set_keymap('n', '<leader>dK', '<cmd>lua require"dap".up()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dJ', '<cmd>lua require"dap".down()<CR>', opt)

vim.api.nvim_set_keymap('', '<leader>de', '<cmd>lua require("dapui").eval()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>du', '<cmd>lua require("dapui").toggle()<CR>', opt)

vim.api.nvim_set_keymap('n', '<leader>dii', '<cmd>lua require("dapui").float_element()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dib', '<cmd>lua require("dapui").float_element("breakpoints")<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dir', '<cmd>lua require("dapui").float_element("repl")<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dis', '<cmd>lua require("dapui").float_element("scopes")<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dit', '<cmd>lua require("dapui").float_element("stacks")<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>diw', '<cmd>lua require("dapui").float_element("watches")<CR>', opt)
