-- Example configuations here: https://github.com/mattn/efm-langserver
-- python
local flake8 = {
    LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}
local isort = {formatCommand = "isort --quiet -", formatStdin = true}
local yapf = {formatCommand = "yapf --quiet", formatStdin = true}

-- lua
local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}

-- JavaScript/React/TypeScript
local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}

local prettier_yaml = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local shellcheck = {
    LintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}

local shfmt = {
  formatCommand = 'shfmt -ci -s -bn',
  formatStdin = true
}

local root_markers = {".zshrc", ".git/"}

require"lspconfig".efm.setup {
    root_dir = require"lspconfig".util.root_pattern(unpack(root_markers)),
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"lua", "python", "javascriptreact", "javascript", "sh", "html", "css", "json", "yaml"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {luaFormat},
            python = {yapf, isort, flake8},
            javascriptreact = {prettier, eslint},
            javascript = {prettier, eslint},
            sh = {shellcheck, shfmt},
            html = {prettier},
            css = {prettier},
            json = {prettier},
            yaml = {prettier_yaml},
        }
    }
}
