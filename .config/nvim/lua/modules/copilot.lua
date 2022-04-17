vim.api.nvim_set_keymap('i', '<C-L>', "copilot#Accept('')", { script = true, silent = true , expr = true})

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
