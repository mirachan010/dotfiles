if !&compatible
  set nocompatible
endif

set encoding=utf-8
set fileencodings=utf-8,cp932,sjis
scriptencoding=utf-8

if has("win32")
  let g:python3_host_prog = 'C:\Python38\python.exe'
  set fileencoding=cp932
  set fileencodings=cp932,sjis,utf-8
  let s:undo_path = expand('C:\user\mira\.cache\vim\undo')
elseif has("unix")
  set fileencoding=utf-8
  set fileencodings=utf-8,cp932,sjis
  scriptencoding=utf-8
  let s:undo_path = expand('~/.cache/vim/undo')
  let g:python3_host_prog = '/root/.anyenv/envs/pyenv/shims/python3'
endif
if has('persistent_undo')
    exe 'set undodir=' . s:undo_path
    set undofile
endif


"-----setup plugins------
let s:dein_dir = expand('~/.vim/dein')
" dein.vim is where
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" if not installed deinvim clone from github
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/defx.nvim')
  call dein#add('kristijanhusak/defx-icons')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('unblevable/quick-scope')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Jagua/vim-denite-ghq')
  call dein#add('junegunn/fzf',{'build':'./install -all'})
  call dein#add('junegunn/fzf.vim')
  call dein#add('thinca/vim-quickrun')
  call dein#add('vim-scripts/VOom')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('mhinz/vim-grepper')
  call dein#add('tpope/vim-fugitive')
  call dein#add('Shougo/neco-vim')
  call dein#add('lighttiger2505/deoplete-vim-lsp')
  call dein#add('vim-jp/vimdoc-ja.git')
  call dein#add('sainnhe/gruvbox-material')
  call dein#add('andymass/vim-matchup')
  call dein#add('mattn/emmet-vim')
"  call dein#add('prabirshrestha/async.vim')
"  call dein#add('prabirshrestha/asyncomplete.vim')
"  call dein#add('prabirshrestha/asyncomplete-lsp.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('mattn/vim-lsp-settings',{'merged':0})
  call dein#add('itchyny/lightline.vim')
    call dein#add('Shougo/deoppet')
  endif
  if has('unix')
    call dein#add('delphinus/vim-denite-memo')
    call dein#add('skanehira/preview-markdown.vim')
  endif
	let g:rc_dir    = expand('~/dots/common/vim/plugins')
	let s:toml      = g:rc_dir . '/00dein.toml'
	let s:lazy_toml = g:rc_dir . '/01dein.toml'
"	let s:lazy_toml_python = g:rc_dir . '\dein_python.toml'
	" TOML を読み込み、キャッシュしておく
	call dein#load_toml(s:toml,      {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
"auto install plugin
if dein#check_install()
  call dein#install()
endif
"if i clean pluginlist auto remove it
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
"-----End setup plugins------


"---start set no plugins keymapping---
noremap k gk
noremap j gj
noremap H ^
noremap L $
noremap u g-
noremap <C-R> g+
inoremap  jj <C-[>
"---fin set no plugins keymapping---

set expandtab
set tabstop=4 shiftwidth=4
augroup MyTabStop
    autocmd!
    autocmd BufNewFile,BufRead *.html      setlocal tabstop=2 shiftwidth=2 fenc=utf-8
    autocmd BufNewFile,BufRead *.js        setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.css       setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.scss      setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.rb        setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.erb       setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead Makefile    setlocal noet
    autocmd BufNewFile,BufRead *.snippets  setlocal noet
    autocmd BufNewFile,BufRead *.yml       setlocal tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.yaml      setlocal tabstop=2 shiftwidth=2
    autocmd Filetype vim setlocal tabstop=2 shiftwidth=2
    autocmd Filetype vim setlocal tabstop=2 shiftwidth=2
augroup END

augroup FiletypeSet
  autocmd BufNewFile,BufRead *.md        setlocal filetype=markdown
  autocmd BufRead,BufNewFile *.scss      setlocal filetype=scss
augroup END

augroup MyGitSpellCheck
    autocmd!
    autocmd FileType gitcommit setlocal spell
augroup END
" Define mappings


"---set locklike---
"to see statusline
set laststatus=2
"To dont see mode in comandline
set noshowmode
"I want to see what operator
set showcmd
"setnumber
set number
set signcolumn=yes
"comandmode complement
set wildmenu


set ttimeout        " time out for key codes
set ttimeoutlen=100    " wait up to 100ms after Esc for special key
set display=truncate

set backspace=2

"Before write to file Backup files
set writebackup
"after write to file Delete Backup
set nobackup
"Dontmake swapfile
set noswapfile

set wrap
"set whichwarp="b,s,h,l,<,>,[,]"

set list
set listchars=tab:»-,extends:»,precedes:«,nbsp:%,eol:↲,trail:~

set hidden

set confirm

set autoread

set smartindent
set autoindent

set scrolloff=15

set splitbelow
set splitright

" Set minimal width for current window.
 set winwidth=30
 " Set minimal height for current window.
 set winheight=1
 " Set maximam maximam command line window.
 set cmdwinheight=5
 " No equal window size.
 set noequalalways
 " Adjust window size of preview and help.
 set previewheight=8
 set helpheight=12
"
"for serch
 set wrapscan
 "if you use s/// is alias to s///g and s///g is s///
 set gdefault

 set hlsearch

 set ignorecase

 set smartcase

 set incsearch

 set history=1000

set clipboard+=unnamedplus,unnamed

set synmaxcol=512
let g:user_emmet_settings = {
\    'variables' : {
\        'lang' : 'ja',
\    }
\}"}



set helplang=ja,en
if has("path_extra")
    set tags+=tags;
endif

let g:deoplete#enable_at_startup = 1
"---start set  plugins keymapping---
let mapleader = "\\"

nmap <Leader>.. :<C-u>source $MYVIMRC<CR>

nmap <Leader>b [browser]
"今やってるマークダウンのページプレビュー
nmap [browser]p <Plug>MarkdownPreview
vmap [browser]p <Plug>MarkdownPreview
"プレビュー終了
nmap [browser]s <Plug>MarkdownPreviewStop
vmap [browser]s <Plug>MarkdownPreviewStop


let g:qs_highlight_on_keys = ['f','F']
let g:gitgutter_map_keys = 0
nmap [g <Plug>(GitGutterPrevHunk)
nmap ]g <Plug>(GitGutterNextHunk)
let g:user_emmet_leader_key = '<C-y>'
"---fin set plugins keymapping---


"---===set colorsceme===---
"use many color
set termguicolors
set background=dark
let g:gruvbox_material_background='hard'
colorscheme molokai
"---===fin colorsceme===---

"---===setup lightline===---
"it is more good statusline
let g:lightline={
  \'colorscheme':'wombat',
  \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename' ] ],
    \    'right':[[ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ],
    \ },
  \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \ },
  \ 'mode_map': {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'VL',
    \ "\<C-v>": 'VB',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'T',
    \},
  \ }

set showtabline=2
let g:lightline.tab_component_function = {
  \'filename':'LightlineTabFilename',
  \ 'modified': 'lightline#tab#modified',
  \ 'readonly': 'lightline#tab#readonly',
  \ 'tabnum': 'lightline#tab#tabnum'}

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! LightlineTabFilename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = pathshorten(expand('#'.buflist[winnr - 1].':f'))
  return _ !=# '' ? _ : '[No Name]'
endfunction
"---===End setup lightline===----
"---====setup vim-lsp==---
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_information = {'text': 'i'}
let g:lsp_signs_hint = {'text': '?'}

nmap <Leader>l [Lsp]
" 定義ジャンプ(デフォルトのctagsによるジャンプを上書きしているのでこのあたりは好みが別れます)
nnoremap [Lsp]<C-]> :<C-u>LspDefinition<CR>
" 定義情報のホバー表示
nnoremap [Lsp]K :<C-u>LspHover<CR>
" 名前変更
nnoremap [Lsp]R :<C-u>LspRename<CR>
" 参照検索
nnoremap [Lsp]n :<C-u>LspReferences<CR>
" Lint結果をQuickFixで表示
nnoremap [Lsp]f :<C-u>LspDocumentDiagnostics<CR>
" テキスト整形
nnoremap [Lsp]s :<C-u>LspDocumentFormat<CR>


" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

syntax enable
filetype plugin indent on
