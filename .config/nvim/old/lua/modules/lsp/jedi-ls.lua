require'lspconfig'.jedi_language_server.setup{
    on_attach = require'modules.lsp'.on_attach,
}
