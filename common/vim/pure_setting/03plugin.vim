"プラグインのインストール
"プラグインの保存場所の設定{{{
"nvim ( win unix )の組み合わせでのそれぞれの設定
if has('nvim')
  if has("win32")
    let s:dein_dir = expand('~\AppData\Local\nvim\dein\')
  elseif has("unix")
    let s:dein_dir = expand('~/.cache/nvim/dein/')
  endif
elseif !has('nvim')
  if has("win32")
    let s:dein_dir = expand('~\.cache\vim\dein\')
  elseif has("unix")
    let s:dein_dir = expand('~/.cache/vim/dein/')
  endif
endif
if has("win32")
    let g:rc_dir    = expand('~\dotfiles\common\vim\')
    let s:dein_repo_dir = s:dein_dir . '\repos\github.com\Shougo\dein.vim'
elseif has("unix")
    let g:rc_dir    = expand('~/dotfiles/common/vim/')
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
endif"}}}
"pluginのインストール{{{
" dein.vim がなければ github から落としてくる
if &runtimepath !~# '\dein.vim'
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
  let s:toml      = g:rc_dir . '00dein.toml'
  let s:lazy_toml = g:rc_dir . '01dein.toml'
  " TOML を読み込み、キャッシュしておく
 call dein#load_toml(s:toml,      {'lazy': 0})
 call dein#load_toml(s:lazy_toml, {'lazy': 1})
  " 設定終了
  call dein#end()
  call dein#save_state()
endif
" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
" もし、未アンインストールものものがあったらアンインストール
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif"}}}
