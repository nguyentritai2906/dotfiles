lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        custom_captures = {
            -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            ["foo.bar"] = "Identifier",
        },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "+",
            scope_incremental = "+",
            node_incremental = "+",
            node_decremental = "_",
        },
    },
    -- indent = {
        -- enable = true
    -- },
    rainbow = {
        enable = true,
        disable = {'bash'} -- please disable bash until I figure #1 out
    }
}
EOF
