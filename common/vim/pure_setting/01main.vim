scriptencoding=utf-8
"外部プログラムの場所の確認
"WinとUbuntuの決定的に分かれるところ
if has("win32")
  let s:undo_path = expand('C:\users\mira\.vim\undo\')
    let g:python3_host_prog = 'C:\Python39\python.exe'
elseif has("unix")
  let s:undo_path = expand('~/.cache/vim/undo')
  let g:python3_host_prog = '~/.anyenv/envs/pyenv/shims/python3'
endif
"Undo保存
if has('persistent_undo')
  exe 'set undodir=' . s:undo_path
  set undofile
endif

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
set ttimeoutlen=10    " wait up to 100ms after Esc for special key
set backspace=2
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
