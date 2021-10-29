require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gsn",
            scope_incremental = "gsn",
            node_incremental = "gsi",
            node_decremental = "gsd",
        },
    },
    indent = {
        enable = true
    },
    rainbow = {
        enable = true,
    disable = {'bash'} -- please disable bash until I figure #1 out
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",

                -- Or you can define your own textobjects like this
                ["iF"] = {
                    python = "(function_definition) @function",
                    cpp = "(function_definition) @function",
                    c = "(function_definition) @function",
                    java = "(method_declaration) @function",
                },
            },
        },
    },
}
