require'lspconfig'.pyright.setup{
    on_attach = require'nv-lsp'.on_attach,
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
