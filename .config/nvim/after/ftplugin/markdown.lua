-- vim.cmd [[source ~/.config/nvim/config/markdown.vim]]
vim.cmd [[
    let g:vim_markdown_no_default_key_mappings = 1
    let g:vim_markdown_folding_disabled = 1
    let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh', 'rust', 'haskell', 'c', 'cpp']
    let g:vim_markdown_math = 1
    let g:vim_markdown_frontmatter = 1
    let g:tex_conceal = "abd"

    autocmd InsertLeave,TextChanged $HOME/Documents/blog/nguyentritaiblog/content/posts/** silent write
]]

-- markdown ftplugin
vim.opt.autoindent = true
vim.opt.linebreak = true
vim.opt_local.conceallevel = 2
vim.opt.textwidth = 120
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

-- if file path begin with ~/Documents/notes then set textwidth to 120
vim.cmd [[autocmd BufEnter * if (expand("%:p:h") == "~/Documents/notes") | set textwidth=120 | endif]]
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.md",
    command = vim.cmd [[set ft=markdown syntax=markdown]]
})
