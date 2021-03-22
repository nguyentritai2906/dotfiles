-- npm i -g bash-language-server
require'lspconfig'.bashls.setup {on_attach = require'nv-lsp'.on_attach}
