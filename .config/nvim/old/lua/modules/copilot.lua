vim.api.nvim_set_keymap('i', '<C-L>', 'copilot#Accept("<CR>")', { script = true, silent = true, expr = true })

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.g.copilot_node_command = "/opt/homebrew/opt/node@16/bin/node"
vim.g.copilot_filetypes = {
    ["dap-repl"] = false,
}

--local status, copilot = pcall(require, "copilot")
--if (not status) then return end

--copilot.setup {
--cmp = {
--enabled = true,
--method = "getCompletionsCycling",
--},
--panel = { -- no config options yet
--enabled = true,
--},
--ft_disable = {"dap-repl"},
--plugin_manager_path = vim.env.HOME .. "/.config/nvim/plugged"
--}
