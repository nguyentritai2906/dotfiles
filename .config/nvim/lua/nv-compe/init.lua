require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        path = {priority = 3};
        buffer = {priority = 2};
        calc = true;
        vsnip = false;
        nvim_lsp = {priority = 4};
        nvim_lua = true;
        spell = true;
        tags = {priority = 1};
        snippets_nvim = false;
        treesitter = true;
        ultisnips = {priority = 5};
    };
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.rust_analyzer.setup {
    capabilities = capabilities,
}

-- vim.api.nvim_set_keymap("i", "<C-Space>", "v:api.compe.complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<CR>", "v:lua.confirm('<CR>')", {expr = true})
-- vim.api.nvim_set_keymap("i", "<C-e>", "v:lua.close('<C-e>')", {expr = true})
-- vim.api.nvim_set_keymap("i", "<C-f>", "v:lua.scroll('delta' : +4)", {expr = true})
-- vim.api.nvim_set_keymap("i", "<C-b>", "v:lua.scroll('delta' : -4)", {expr = true})

-- inoremap <silent><expr> <C-Space> compe#complete()
-- inoremap <silent><expr> <CR>      compe#confirm('<CR>')
-- inoremap <silent><expr> <C-e>     compe#close('<C-e>')
-- inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
-- inoremap <silent><expr> <C-b>     compe#scroll({ 'delta': -4 })

