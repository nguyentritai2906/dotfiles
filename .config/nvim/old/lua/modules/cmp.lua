local cmp = require 'cmp'
local lspkind = require('lspkind')

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end
    },
    sources = {
        {name = 'luasnip', keyword_length = 1}, {name = 'nvim_lsp', keyword_length = 1},
        {name = 'path', keyword_length = 1, max_item_count = 3},
        {name = 'buffer', keyword_length = 1, max_item_count = 3}
        -- { name = 'ultisnips', keyword_length = 1 },
        -- { name = 'tmux', keyword_length=1, max_item_count=3 },
        -- { name = 'rg', keyword_length=1, max_item_count=3 }, -- high cpu usage
        -- { name = 'look', keyword_length=1, options={convert_case=true, loud=true}, max_item_count=3 },
    },
    mapping = {
        ['<C-j>'] = cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Insert, select = True},
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ['<C-d>'] = cmp.mapping.scroll_docs(5),
        ['<C-u>'] = cmp.mapping.scroll_docs(-5),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort()
    },
    formatting = {format = lspkind.cmp_format({with_text = true, maxwidth = 50})}
})
