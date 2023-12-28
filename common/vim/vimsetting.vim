" startsetting
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,sjis
scriptencoding=utf-8

" Set augroup.
augroup MyAutoCmd
  autocmd!
augroup END

" Read other files
set runtimepath+=~/dotfiles/common/vim
runtime! rc/03*_rc.vim
"call dein#remote_plugins()

" Set Colors
" set termguicolors
set background=dark

filetype plugin indent on
syntax enable
