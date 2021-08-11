require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    resolve_timeout = 800;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = {
        border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1,
    };

    source = {
        path = {true, priority = 4};
        buffer = {true, priority = 3};
        calc = false;
        vsnip = false;
        nvim_lsp = {true, priority = 6};
        nvim_lua = true;
        spell = false;
        tags = false;
        snippets_nvim = false;
        treesitter = {true, priority = 5};
        ultisnips = {true, priority = 7};
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

vim.cmd([[inoremap <silent><expr> <C-Space> compe#complete()]])
vim.cmd([[inoremap <silent><expr> <CR>      compe#confirm('<CR>')]])
vim.cmd([[inoremap <silent><expr> <C-e>     compe#close('<C-e>')]])
-- vim.cmd([[inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })]])
-- vim.cmd([[inoremap <silent><expr> <C-b>     compe#scroll({ 'delta': -4 })]])
