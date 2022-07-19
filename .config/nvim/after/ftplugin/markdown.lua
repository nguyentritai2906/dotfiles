vim.cmd[[source ~/.config/nvim/config/markdown.vim]]

-- markdown ftplugin
vim.opt.autoindent = true
vim.opt.linebreak = true
vim.opt_local.conceallevel = 2
vim.opt.textwidth = 80
vim.opt.wrap = true

-- -- @TODOUA:
-- -- spell is not staying local for some reason
-- -- have to set nospell in other fts that are opened after a markdown
-- vim.opt_local.spell = true

-- -- Markdown Preview
-- -- For Glow, just type :Glow
-- vim.api.nvim_buf_set_keymap(0, "n", ",md", "<Plug>MarkdownPreview", { noremap = false })

-- match and highlight hyperlinks
-- -- standalone
vim.fn.matchadd("matchURL", [[http[s]\?:\/\/[[:alnum:]%\/_#.-]*]])
vim.cmd "hi matchURL guifg=DodgerBlue"

-- grey out for strikethrough
vim.fn.matchadd("matchStrike", [[[~]\{2}.\+[~]\{2}]])
vim.cmd "hi matchStrike guifg=gray"

