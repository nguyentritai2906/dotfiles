local tog = require("toggle_lsp_diagnostics")

vim.cmd[[
command! -nargs=0 ToggleDiagText lua require'toggle_lsp_diagnostics'.toggle_virtual_text()
]]

