scriptencoding=utf-8
""外部プログラムの場所の確認
"WinとUbuntuの決定的に分かれるところ
if has("win32")
  let s:undo_path = expand('C:\users\mira\.cache\vim\undo\')
    let g:python3_host_prog = 'C:\Users\mira\AppData\Local\Programs\Python\Python310\python.exe'
elseif has("unix")
  let s:undo_path = expand('~/.cache/vim/undo')
  let g:python3_host_prog = '~/.anyenv/envs/pyenv/shims/python3'
endif
"Undo保存
if has('persistent_undo')
  exe 'set undodir=' . s:undo_path
  set undofile
endif
"-----------------
" Disable default plugins
"-----------------
"let g:did_install_default_menus = 1
"let g:did_install_syntax_menu   = 1
"let g:did_indent_on             = 1
"let g:did_load_filetypes        = 1
" load ftplugin to set commentstring
" let g:did_load_ftplugin         = 1
let g:loaded_2html_plugin       = 1
let g:loaded_gzip               = 1
let g:loaded_man                = 1
let g:loaded_matchit            = 1
let g:loaded_matchparen         = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_remote_plugins     = 1
let g:loaded_shada_plugin       = 1
let g:loaded_spellfile_plugin   = 1
let g:loaded_tarPlugin          = 1
let g:loaded_tutor_mode_plugin  = 1
let g:loaded_zipPlugin          = 1
"let g:skip_loading_mswin        = 1

set number
set cursorline
set cursorlineopt=number

if has("path_extra")
  set tags+=tags;
endif

set writebackup
set nobackup
set noswapfile
set laststatus=2
set showcmd
set wildmenu
set ttimeout        " time out for key codes
set ttimeoutlen=20    " wait up to 100ms after Esc for special key
set backspace=indent,eol,start
set ambiwidth=double

set wrap
"set whichwarp="b,s,h,l,<,>,[,]"

set list
set listchars=tab:»-,extends:»,precedes:«,nbsp:%,eol:↲,trail:~
set hidden

set confirm

set autoread
set smartindent
set autoindent

augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END

set splitbelow
set splitright

" Set maximam maximam command line window.
set cmdwinheight=5
" No equal window size.
set noequalalways

" Adjust window size of preview and help.
set previewheight=8
set helpheight=12

set wrapscan
set hlsearch
set ignorecase
set smartcase
set incsearch

set history=1000

set updatetime=100

set clipboard+=unnamedplus,unnamed
set synmaxcol=0

set noshowmode

" Auto mkdir
" https://vim-jp.org/vim-users-jp/2011/02/20/Hack-202.html
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  " {{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}
