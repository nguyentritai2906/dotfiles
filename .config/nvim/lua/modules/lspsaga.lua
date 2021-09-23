local saga = require 'lspsaga'

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
vim.api.nvim_set_keymap("i", "C-k", "lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)

saga.init_lsp_saga()
