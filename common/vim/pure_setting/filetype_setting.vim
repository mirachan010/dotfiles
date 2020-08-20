" Tab setting for file type
set expandtab tabstop=4 shiftwidth=4
augroup MyTabStop
    autocmd!
    autocmd BufNewFile,BufRead *.rhtml     setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html      setlocal tabstop=2 shiftwidth=2 fenc=utf-8
    autocmd BufNewFile,BufRead *.js        setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.css       setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.scss      setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.rb        setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.erb       setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.py        setlocal tabstop=4 shiftwidth=4 fenc=utf-8
    autocmd BufNewFile,BufRead Makefile    setlocal noet
    autocmd BufNewFile,BufRead *.snippets  setlocal noet
    autocmd BufNewFile,BufRead *.yml       setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.yaml      setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.toml      setlocal tabstop=2 shiftwidth=2 fenc=utf-8
    autocmd BufNewFile,BufRead *.vim       setlocal tabstop=2 shiftwidth=2 fenc=utf-8
    autocmd FileType           vim         setlocal tabstop=2 shiftwidth=2 fenc=utf-8
augroup END

augroup MyGitSpellCheck
    autocmd!
    autocmd FileType gitcommit setlocal spell fileencoding=utf-8
  autocmd FileType gina-commit setlocal spell fenc=utf-8
augroup END
