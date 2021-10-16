local dap = require('dap')

dap.adapters.python = {
  type = 'executable';
  command = '/Users/mater/.virtualenvs/debugpy/bin/python3.9';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    justMyCode = true;
    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/env/bin/python') == 1 then
        return cwd .. '/env/bin/python'
      elseif vim.fn.executable(cwd .. '/.env/bin/python') == 1 then
        return cwd .. '/.env/bin/python'
      else
        return '/usr/bin/python3'
      end
    end;
  },
}

vim.fn.sign_define("DapBreakpoint", { text = "⧐", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⧐", texthl = "Success", linehl = "", numhl = "" })

-- Nvim DAP Virtual Text
vim.g.dap_virtual_text = true

local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

-- Nvim DAP UI
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 0.25 },
    },
    size = 60,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 17,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})

local opt = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dB', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dE', '<cmd>lua require"dap".set_exception_breakpoints({"all"})<CR>', opt)

vim.api.nvim_set_keymap('n', '<leader>dh', '<cmd>lua require"dap".step_out()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua require"dap".step_into()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dk', '<cmd>lua require"dap".step_back()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dj', '<cmd>lua require"dap".step_over()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua require"dap".continue()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua require"dap".run_to_cursor()<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>dq', '<cmd>lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close()<CR>', opt)

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
