#!/bin/bash

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitignore" ] && continue
    [ "$f" = ".require_oh-my-zsh" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    [ "$f" = ".xmodmap" ] && continue
    [ "$f" = ".config" ] && continue
    [ "$f" = ".zshrc" ] && continue
    rm -rf ~/"$f"
    ln -snfv ~/dotfiles/"$f" ~/
done

[ -e ~/.gitconfig.local ] || cp ~/dotfiles/.gitconfig.local.template ~/.gitconfig.local

# ここからはファイル移動系設定
rm -rf ~/.config/nvim
mkdir ~/.config/nvim
ln -snfv ~/dotfiles/init.vim ~/.config/nvim/
rm  -rf ~/.config/terminator
ln  -snfv ~/dotfiles/.config/terminator/ ~/.config/terminator
ln -snfv ~/dotfiles/zshrc.win ~/.xmodmap

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************
END 
