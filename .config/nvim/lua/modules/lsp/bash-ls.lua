-- npm i -g bash-language-server
require'lspconfig'.bashls.setup {on_attach = require'modules.lsp'.on_attach}
