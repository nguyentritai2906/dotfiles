require'lspconfig'.clangd.setup{
    cmd = { "clangd", "--background-index" },
    on_attach = require'modules.lsp'.on_attach,
    filetypes = { "c", "cpp", "objc", "objcpp" },
}
