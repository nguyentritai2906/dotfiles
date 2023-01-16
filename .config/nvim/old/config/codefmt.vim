" CodeFmt
call glaive#Install()
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /Users/mater/soft/google-java-format/google-java-format-1.9-all-deps.jar -a"
Glaive codefmt clang_format_style="{IndentWidth: 4}"

augroup autoformat_settings
    autocmd FileType bzl AutoFormatBuffer buildifier
    autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
    autocmd FileType dart AutoFormatBuffer dartfmt
    autocmd FileType go AutoFormatBuffer gofmt
    autocmd FileType gn AutoFormatBuffer gn
    autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
    " Alternative: autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer tidy
    " Alternative: autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer prettier
    autocmd FileType java AutoFormatBuffer google-java-format
    " autocmd FileType python AutoFormatBuffer  autopep8
    autocmd FileType python AutoFormatBuffer  yapf
    " Alternative: autocmd FileType python AutoFormatBuffer yapf
    autocmd FileType rust AutoFormatBuffer rustfmt
    autocmd FileType vue AutoFormatBuffer prettier
augroup END
