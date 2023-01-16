local lsp = require('lsp-zero')
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require("luasnip")

local user_define = {}

local function on_attach(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
    end

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', '<space>lgD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<space>lgd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<space>lgr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<space>lpd', '<cmd>lua require("goto-preview").goto_preview_definition()<CR>', opts)
    buf_set_keymap('n', '<space>lpi', '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>', opts)
    buf_set_keymap('n', '<space>lpr', '<cmd>lua require("goto-preview").goto_preview_references()<CR>', opts)
    buf_set_keymap('n', '<space>lpc', '<cmd>lua require("goto-preview").close_all_win()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<space>lk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>ld', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>lgk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<space>lgj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>lq', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>lv', '<cmd>lua require("modules.lsp/virtual-text").toggle()<CR>', opts)
    buf_set_keymap('n', '<space>lE', '<cmd>lua require"toggle_lsp_diagnostics".toggle_virtual_text()<CR>', opts)

    -- Only EMF has format capabilities
    if client.name ~= 'efm' then client.server_capabilities.documentFormattingProvider = false end

    if client.server_capabilities.documentFormattingProvider then
        vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    end

    require"lsp_signature".on_attach()
end

function user_define.on_attach(client, bufnr)
    on_attach(client, bufnr)
end

-- LSP Zero
lsp.preset('recommended')
lsp.ensure_installed({
    'tsserver', 'eslint', 'sumneko_lua', 'pyright', 'bashls', 'vimls', 'jsonls', 'yamlls', 'dockerls', 'html', 'cssls',
    'tailwindcss', 'gopls'
})

-- Configure LSPs
lsp.configure('sumneko_lua', {on_attach = on_attach, settings = {Lua = {workspace = {checkThirdParty = false}}}})

-- Cmp setup
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

lsp.setup_nvim_cmp({
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
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Insert, select = true},
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"}),
        ['<C-d>'] = cmp.mapping.scroll_docs(5),
        ['<C-u>'] = cmp.mapping.scroll_docs(-5),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort()
    }),
    formatting = {format = lspkind.cmp_format({with_text = true, maxwidth = 50})}
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local',
    sign_icons = {error = '', warn = '', hint = '', info = ''}
})

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.on_attach = on_attach
lsp.setup()

require('toggle_lsp_diagnostics').init({start_on = true})
vim.diagnostic.config({virtual_text = true})

require("mason").setup()

return user_define
