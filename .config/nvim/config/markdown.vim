let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_folding_disabled = 1
let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh', 'rust', 'haskell', 'c', 'cpp']
" let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

autocmd BufRead,BufNewFile /home/solus/Documents/blog/nguyentritaiblog/content/posts/** set tw=80 | set wrap
autocmd InsertLeave,TextChanged /home/solus/Documents/blog/nguyentritaiblog/content/posts/** silent write
