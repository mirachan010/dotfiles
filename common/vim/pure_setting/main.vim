scriptencoding=utf-8
"外部プログラムの場所の確認
"WinとUbuntuの決定的に分かれるところ
if has("win32")
  let g:python3_host_prog = 'C:\Python38\python.exe'
  set fileencoding=cp932
  set fileencodings=cp932,sjis,utf-8
  let s:undo_path = expand('~\.cache\vim\undo')
  "Windows限定のプラグイン設定
  let g:deoplete#sources#clang#clang_header = 'C:\Program Files\LLVM\lib\clang\9.0.0\include'
  let g:deoplete#sources#clang#clang_header = 'C:\Program Files\LLVM\lib\clang\'
  let g:deoplete#sources#clang#libclang_path = 'C:\Program Files\LLVM\bin\libclang.dll'
elseif has("unix")
  let s:undo_path = expand('~/.cache/vim/undo')
  let g:python3_host_prog = '/usr/bin/python3'
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

set wrap
"set whichwarp="b,s,h,l,<,>,[,]"

set list
set listchars=tab:»-,extends:»,precedes:«,nbsp:%,eol:↲,trail:~

set hidden

set confirm

set autoread

set smartindent
set autoindent

set scrolloff=10

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
