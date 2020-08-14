set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,sjis
scriptencoding=utf-8
set runtimepath+=~/dotfiles/common/vim
"Undo保存
if has('persistent_undo')
	let undo_path = expand('/home/mira/.config/nvim/undo/')
	exe 'set undodir=' . undo_path
	set undofile
endif
"外部プログラムの場所の確認
"WinとUbuntuの決定的に分かれるところ
let g:python3_host_prog = '/home/mira/.anyenv/envs/pyenv/shims/python3'
"プラグインのインストール
"プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.config/nvim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . s:dein_repo_dir
endif
" 設定開始
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	" プラグインリストを収めた TOML ファイル
	" ~/.vim/rc/dein.toml,deinlazy.tomlを用意する
	let g:rc_dir    = expand('~/dotfiles/common/vim/plugins')
	let s:toml      = g:rc_dir . '/00dein.toml'
	let s:lazy_toml = g:rc_dir . '/01dein.toml'
	let s:lazy_toml_python = g:rc_dir . '/dein_python.toml'
	" TOML を読み込み、キャッシュしておく
	call dein#load_toml(s:toml,      {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})
	call dein#load_toml(s:lazy_toml_python, {'lazy': 1})
	" 設定終了
	call dein#end()
	call dein#save_state()
endif
" もし、未インストールものものがあったらインストール
if dein#check_install()
	call dein#install()
endif


runtime! users/*.vim
runtime! plugins/*.vim

filetype plugin on

"ubuntu限定のプラグイン設定
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang-6.0.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/'
