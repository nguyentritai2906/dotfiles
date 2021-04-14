require'lspconfig'.pyright.setup{
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
