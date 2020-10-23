" startsetting
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,sjis
scriptencoding=utf-8

" Read other files
set runtimepath+=~/dotfiles/common/vim
runtime! pure_setting/*.vim
runtime! plug_setting/*.vim


" Set Colors
set termguicolors
set background=dark

colorscheme tokyonight

filetype plugin indent on
syntax enable

