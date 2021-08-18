local cmd = { 'pyright-langserver', '--stdio' }
require'lspconfig'.pyright.setup{
    cmd = cmd,
    on_attach = require'modules.lsp'.on_attach,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off"
            }
        }
    }
}