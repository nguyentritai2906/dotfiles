local lsp = require('lsp-zero')
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require("luasnip")

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
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<space>lpd', '<cmd>lua require("goto-preview").goto_preview_definition()<CR>', opts)
    buf_set_keymap('n', '<space>lpi', '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>', opts)
    buf_set_keymap('n', '<space>lpr', '<cmd>lua require("goto-preview").goto_preview_references()<CR>', opts)
    buf_set_keymap('n', '<space>lpc', '<cmd>lua require("goto-preview").close_all_win()<CR>', opts)
    buf_set_keymap('n', '<space>lk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>ld', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>lgk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<space>lgj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>lE', '<cmd>lua require"toggle_lsp_diagnostics".toggle_virtual_text()<CR>', opts)
    buf_set_keymap('n', '<space>le', '<cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>', opts)

    -- Only EMF has format capabilities
    if client.name ~= 'efm' then client.server_capabilities.documentFormattingProvider = false end

    if client.server_capabilities.documentFormattingProvider then
        vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    end

    require"lsp_signature".on_attach()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- LSP Zero
lsp.preset('recommended')

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
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Insert, select = true},
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

-- Setup mason so it can manage external tooling
require('mason').setup()
local servers = {
    tsserver = {},
    eslint = {},
    pyright = {},
    bashls = {},
    vimls = {},
    jsonls = {},
    yamlls = {},
    dockerls = {},
    html = {},
    cssls = {},
    tailwindcss = {},
    gopls = {},
    sumneko_lua = {
        Lua = {workspace = {checkThirdParty = false}, telemetry = {enable = false}, diagnostics = {globals = {'vim'}}}
    }
}
-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {ensure_installed = vim.tbl_keys(servers)}
mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name]
        }
    end
}

-- efm-langserver
local flake8 = {
    LintCommand = "flake8 --max-line-length 120 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    formatStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}
local isort = {formatCommand = "isort --quiet -", formatStdin = true}
local yapf = {formatCommand = "yapf --quiet", formatStdin = true}
local autopep8 = {formatCommand = "autopep8 -", formatStdin = true}
local autoflake = {
    formatCommand = "autoflake --in-place --remove-unused-variables --remove-all-unused-imports -",
    formatStdin = true
}
local black = {formatCommand = "black --quiet -", formatStdin = true}
local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
local prettier_yaml = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
local eslint = {
    lintCommand = "eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules..bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}
local shellcheck = {
    LintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}
local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}
local rustfmt = {formatCommand = "rustfmt", formatStdin = true}
local root_markers = {".zshrc", ".git/"}

require"lspconfig".efm.setup {
    on_attach = on_attach,
    root_dir = require"lspconfig".util.root_pattern(unpack(root_markers)),
    init_options = {
        documentFormatting = true,
        hover = true,
        documentSymbol = true,
        codeAction = true,
        completion = true
    },
    filetypes = {"lua", "python", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml", "rust", "go"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {luaFormat},
            python = {autoflake, isort, yapf, flake8, autopep8, black},
            javascriptreact = {prettier, eslint},
            javascript = {prettier, eslint},
            sh = {shfmt, shellcheck},
            html = {prettier},
            css = {prettier},
            json = {prettier},
            yaml = {prettier_yaml},
            rust = {rustfmt},
            go = {}
        }
    }
}
