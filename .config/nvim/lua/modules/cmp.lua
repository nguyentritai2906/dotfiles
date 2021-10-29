local cmp = require'cmp'

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
        { name = 'ultisnips' },
        { name = 'nvim_lsp'},
        { name = 'nvim_lua'},
        { name = 'path'},
        { name = 'buffer', keyword_length=5, max_item_count=3 },
        { name = 'tmux', keyword_length=5, max_item_count=3 },
        { name = 'rg', keyword_length=5, max_item_count=3 },
        { name = 'look', keyword_length=5, options={convert_case=true, loud=true}, max_item_count=3 },
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
        format = lspkind.cmp_format({with_text = true, maxwidth = 50}),
    },
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require'lspconfig'.pyright.setup {
  capabilities = capabilities,
}
