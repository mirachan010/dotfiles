"プラグインのインストール
"プラグインの保存場所の設定{{{
"( win unix )の組み合わせでのそれぞれの設定
if has("win32")
    let s:dein_dir = expand('~\.cache\vim\dein\')
    let s:dein_repo_dir = s:dein_dir . 'repos\github.com\Shougo\dein.vim'
elseif has("unix")
    let s:dein_dir = expand('~/.cache/vim/dein/')
    let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim'
endif"}}}
" In Windows, auto_recache is disabled.  It is too slow.
let g:dein#auto_recache = !has('win32')

let g:dein#lazy_rplugins = v:true
let g:dein#install_progress_type = 'title'
let g:dein#install_check_diff = v:true
let g:dein#enable_notification = v:true

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
  let s:base_dir = fnamemodify(expand('<sfile>'), ':h') . '/'
  let g:dein#inline_vimrcs = ['01main_rc.vim', '02keymapping_rc.vim']
  call map(g:dein#inline_vimrcs, { _, val -> s:base_dir . val })
  " プラグインリストを収めた TOML ファイル
  " ~/.vim/rc/dein.toml,deinlazy.tomlを用意する
  let s:dein_toml      = s:base_dir . '00dein.toml'
  let s:dein_lazy_toml = s:base_dir . '01dein.toml'
  let s:dein_ddc_toml  = s:base_dir . '01ddc.toml'
  let s:dein_ddu_toml  = s:base_dir . '01ddu.toml'
  let s:dein_ft_toml   = s:base_dir . 'deinft.toml'
  call dein#begin(s:dein_dir, [
        \ expand('<sfile>'), s:dein_toml, s:dein_lazy_toml, s:dein_ddc_toml, s:dein_ft_toml
        \ ])
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:dein_toml,      {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
  call dein#load_toml(s:dein_ddc_toml,  {'lazy': 1})
  call dein#load_toml(s:dein_ddu_toml,  {'lazy': 1})
  call dein#load_toml(s:dein_ft_toml)
  " 設定終了
  call dein#end()
  call dein#save_state()
endif
" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
"" もし、未アンインストールものものがあったらアンインストール
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif"}}}

"command! PlugUpdate call dein#check_update()
