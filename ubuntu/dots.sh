#!/bin/bash

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update
if [ -e ~/.config ]; then
    mv .config/* $THIS_DIR/.config/ -uf
fi
echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitignore" ] && continue
    [ "$f" = ".require_oh-my-zsh" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    [ "$f" = ".config" ] && continue
    rm -rf ~/"$f"
    ln -snfv "$THIS_DIR"/"$f" ~/
done


# ここからはファイル個別移動系設定
rm -rf ~/.config/nvim
mkdir ~/.config/nvim
ln -snfv "$THIS_DIR"/../common/neovim/init.lua ~/.config/nvim/init.lua
ln -snfv "$THIS_DIR"/../common/neovim/lua ~/.config/nvim/lua
rm -rf ~/.gitconfig
ln -snfv "$THIS_DIR"/../common/.gitconfig ~/.gitconfig
ln -snfv "$THIS_DIR"/../common/vim/vimsetting.vim ~/.vimrc
cp "$THIS_DIR"/../ubuntu/defaultpath.sh ~/.localvimpath

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************
END 
