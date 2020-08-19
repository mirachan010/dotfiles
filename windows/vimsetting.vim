" startsetting
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,sjis
scriptencoding=utf-8

set runtimepath+=~/dotfiles/common/vim
runtime! pure_setting/*.vim
runtime! plug_setting/*.vim

"source ~/dotfiles/common/vim/main.vim
"source ~/dotfiles/common/vim/filetype_setting.vim
"source ~/dotfiles/common/vim/keymapping.vim
"source ~/dotfiles/common/vim/plugin.vim
"source ~/dotfiles/common/vim/lightline.vim
"source ~/dotfiles/common/vim/cocseting.vim

set termguicolors
set background=dark

if empty(globpath(&rtp, 'colors/vim-monokai-tasty.vim'))
    if empty(globpath(&rtp, 'colors/gruvbox-material.vim'))
        if empty(globpath(&rtp, 'colors/molokai.vim'))
            colorscheme darkblue
        else
            colorscheme molokai
        endif
    else
        colorscheme gruvbox-material
    endif
else
    colorscheme vim-monokai-tasty
endif

filetype plugin indent on
syntax enable
