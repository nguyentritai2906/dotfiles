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
        { name = 'buffer'},
        { name = 'path'},
        { name = 'nvim_lua'},
        { name = 'latex_symbols'},
        { name = 'look', keyword_length=2, opts={convert_case=true, loud=true} }
        -- { name = 'spell'},
        -- more sources
    },
    -- Configure for <TAB> people
    -- - <TAB> and <S-TAB>: cycle forward and backward through autocompletion items
    -- - <TAB> and <S-TAB>: cycle forward and backward through snippets tabstops and placeholders
    -- - <TAB> to expand snippet when no completion item selected (you don't need to select the snippet from completion item to expand)
    -- - <C-space> to expand the selected snippet from completion menu
    mapping = {
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
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
