require('toggle_lsp_diagnostics').init()

local nvim_lsp = require('lspconfig')

local function on_attach(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
    end

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true , silent=true }
    buf_set_keymap('n' , '<space>lgD' , '<Cmd>lua vim.lsp.buf.declaration()<CR>'                                , opts)
    buf_set_keymap('n' , '<space>lgd' , '<Cmd>lua vim.lsp.buf.definition()<CR>'                                 , opts)
    buf_set_keymap('n' , '<space>lgr' , '<cmd>lua vim.lsp.buf.references()<CR>'                                 , opts)
    buf_set_keymap('n' , '<space>lgi' , '<cmd>lua vim.lsp.buf.implementation()<CR>'                             , opts)
    buf_set_keymap('n' , '<space>lpd'  , '<cmd>lua require("goto-preview").goto_preview_definition()<CR>'       , opts)
    buf_set_keymap('n' , '<space>lpi'  , '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>'   , opts)
    buf_set_keymap('n' , '<space>lpr'  , '<cmd>lua require("goto-preview").goto_preview_references()<CR>'       , opts)
    buf_set_keymap('n' , '<space>lpc'  , '<cmd>lua require("goto-preview").close_all_win()<CR>'                 , opts)
    buf_set_keymap('n' , 'K'          , '<Cmd>lua vim.lsp.buf.hover()<CR>'                                      , opts)
    buf_set_keymap('n' , '<space>lk'  , '<cmd>lua vim.lsp.buf.signature_help()<CR>'                             , opts)
    buf_set_keymap('n' , '<space>lwa' , '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'                       , opts)
    buf_set_keymap('n' , '<space>lwr' , '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'                    , opts)
    buf_set_keymap('n' , '<space>lwl' , '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>' , opts)
    buf_set_keymap('n' , '<space>ld'  , '<cmd>lua vim.lsp.buf.type_definition()<CR>'                            , opts)
    buf_set_keymap('n' , '<space>lr'  , '<cmd>lua vim.lsp.buf.rename()<CR>'                                     , opts)
    buf_set_keymap('n' , '<space>lgk' , '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'                           , opts)
    buf_set_keymap('n' , '<space>lgj' , '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'                           , opts)
    buf_set_keymap('n' , '<space>lq'  , '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>'                         , opts)
    buf_set_keymap('n' , '<space>lv'  , '<cmd>lua require("modules.lsp/virtual-text").toggle()<CR>'             , opts)
    buf_set_keymap('n' , '<space>lE'  , '<cmd>lua require"toggle_lsp_diagnostics".toggle_virtual_text()<CR>'    , opts)

    -- -- Set some keybinds conditional on server capabilities
    -- if client.resolved_capabilities.document_formatting then
        -- buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

        -- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync({}, 1000)]]
    -- elseif client.resolved_capabilities.document_range_formatting then
        -- buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    -- end

    -- Only EMF has format capabilities
    if client.name ~= 'efm' then
        client.resolved_capabilities.document_formatting = false
    end

    if client.resolved_capabilities.document_formatting then
        vim.cmd [[
        augroup Format
        au! * <buffer>
        au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
        augroup END
        ]]
    end

    require "lsp_signature".on_attach()

end

local tog = require("toggle_lsp_diagnostics")
tog.init()

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
-- local servers = {"vimls"} -- Somehow this cause handler.lua error 'format expected number, got nil'
local servers = {}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end

local user_define = {}

function user_define.on_attach(client, bufnr)
    on_attach(client, bufnr)
end

return user_define
