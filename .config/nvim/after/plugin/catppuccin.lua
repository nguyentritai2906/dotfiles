local catppuccin = require("catppuccin")

require("catppuccin").setup({
    compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
    transparent_background = true,
    term_colors = false,
    dim_inactive = {enabled = false, shade = "dark", percentage = 0.15},
    styles = {
        comments = {"italic"},
        conditionals = {"italic"},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {}
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
    color_overrides = {},
    custom_highlights = {}
})

-- vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
-- vim.cmd[[colorscheme catppuccin]]

local dn = require('dark_notify')
-- Configure
dn.run({
    schemes = {dark = "catppuccin", light = "catppuccin"},
    before = function(mode)
        -- os.execute("$HOME/.config/scripts/switch_theme.sh " .. mode)
        if mode == "dark" then
            vim.g.catppuccin_flavour = "macchiato"
        else
            vim.g.catppuccin_flavour = "latte"
        end
    end,
    after = function(mode)
    end
})
dn.update()
