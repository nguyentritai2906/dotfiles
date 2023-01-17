require('copilot').setup({
    panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {jump_prev = "[[", jump_next = "]]", accept = "<CR>", refresh = "gr", open = "<M-CR>"}
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = "<C-l>",
            accept_word = false,
            accept_line = false,
            next = "‘", -- <Opt-]>
            prev = "“", -- <Opt-[>
            dismiss = "<C-]>"
        }
    },
    filetypes = {
        yaml = true,
        markdown = true,
        help = true,
        gitcommit = true,
        gitrebase = true,
        hgcommit = true,
        svn = true,
        cvs = true,
        ["."] = true,
        ["dap-repl"] = false
    },
    copilot_node_command = 'node', -- Node.js version must be > 16.x
    server_opts_overrides = {}
})

-- NOTE: For github/copilot.vim
--
-- vim.api.nvim_set_keymap('i', '<C-L>', 'copilot#Accept("<CR>")', {script = true, silent = true, expr = true})
--
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""
-- vim.g.copilot_node_command = "/opt/homebrew/opt/node@16/bin/node"
-- vim.g.copilot_filetypes = {["dap-repl"] = false}
