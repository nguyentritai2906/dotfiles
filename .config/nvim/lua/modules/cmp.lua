local cmp = require 'cmp'

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    sources = {
        { name = 'ultisnips', keyword_length = 1 },
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'path', keyword_length = 1, max_item_count = 3 },
        { name = 'buffer', keyword_length = 1, max_item_count = 3 },
        -- rg -> high cpu usage
        -- { name = 'tmux', keyword_length=1, max_item_count=3 },
        -- { name = 'rg', keyword_length=1, max_item_count=3 },
        -- { name = 'look', keyword_length=1, options={convert_case=true, loud=true}, max_item_count=3 },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = True,
        },
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
    },
    formatting = {
        format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
    },
})
