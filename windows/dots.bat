mkdir %APPDATA%\..\Local\nvim\
mklink %APPDATA%\..\..\.vimrc %APPDATA%\..\..\dotfiles\common\vim\vimsetting.vim
mklink %APPDATA%\..\..\.gvimrc %APPDATA%\..\..\dotfiles\windows\.gvimrc
mklink %APPDATA%\..\..\small.vim %APPDATA%\..\..\dotfiles\common\vim\small.vim
mklink %APPDATA%\..\Local\nvim\init.lua %APPDATA%\..\..\dotfiles\common\neovim\init.lua
mklink /d %APPDATA%\..\Local\nvim\lua %APPDATA%\..\..\dotfiles\common\neovim\lua
mklink %APPDATA%\..\Local\nvim\ginit.vim %APPDATA%\..\..\dotfiles\windows\ginit.vim
mklink %APPDATA%\..\Local\nvim\coc-settings.json %APPDATA%\..\..\dotfiles\windows\coc-settings.json
mklink %APPDATA%\..\..\.gitconfig %APPDATA%\..\..\dotfiles\common\.gitconfig
