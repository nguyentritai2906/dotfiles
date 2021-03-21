local nvim_lsp = require('lspconfig')
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local opts = { noremap=true , silent=true }
buf_set_keymap('n'          , '<space>lgD'          , '<Cmd>lua vim.lsp.buf.declaration()<CR>'                                , opts)
buf_set_keymap('n'          , '<space>lgd'          , '<Cmd>lua vim.lsp.buf.definition()<CR>'                                 , opts)
buf_set_keymap('n'          , '<space>lgr'          , '<cmd>lua vim.lsp.buf.references()<CR>'                                 , opts)
buf_set_keymap('n'          , '<space>lgi'          , '<cmd>lua vim.lsp.buf.implementation()<CR>'                             , opts)
buf_set_keymap('n'          , 'K'           , '<Cmd>lua vim.lsp.buf.hover()<CR>'                                      , opts)
buf_set_keymap('n'          , '<space>lk'       , '<cmd>lua vim.lsp.buf.signature_help()<CR>'                             , opts)
buf_set_keymap('n'          , '<space>lwa'   , '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'                       , opts)
buf_set_keymap('n'          , '<space>lwr'   , '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'                    , opts)
buf_set_keymap('n'          , '<space>lwl'   , '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>' , opts)
buf_set_keymap('n'          , '<space>ld'    , '<cmd>lua vim.lsp.buf.type_definition()<CR>'                            , opts)
buf_set_keymap('n'          , '<space>lr'   , '<cmd>lua vim.lsp.buf.rename()<CR>'                                     , opts)
buf_set_keymap('n'          , '<space>le'    , '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>'               , opts)
buf_set_keymap('n'          , '<space>lgk'  , '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'                           , opts)
buf_set_keymap('n'          , '<space>lgj'  , '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'                           , opts)
buf_set_keymap('n'          , '<space>lq'    , '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>'                         , opts)

local function on_attach(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
    end

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

        vim.api.nvim_command[[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]
        -- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]] -- Not work!!
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {"pyright", "vimls", "jdtls"}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end

local user_define = {}

function user_define.on_attach(client, bufnr)
    on_attach(client, bufnr)
end

return user_define
