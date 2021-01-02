#!/bin/bash

# Setting some PATH
if [ -e ~/.localvimpath ]; then
    source ~/.localvimpath
else
    THIS_DIR=$(cd $(dirname $0); pwd)
    source "$THIS_DIR"/defultpath.sh
fi
if [ $1 -eq "-y" ]; then
    YN=1
fi


if [ -e $VIMPATH ]; then
    cd $VIMPATH
    echo checking vim version now.
    GitHubVer=$(git ls-remote origin |tail -1|awk '{print $2}'|sed 's/refs\/tags\///')
    MyVer=$(git tag|tail -1)
    if [ "$GitHubVer" != "$MyVer" ]; then
        if [ "$YN" == 0 ]
            read -p "Update vim?\n(y/n)>>" YN
            if [[ "$YN" != [yY] ]]; then
                exit 1
            fi
        fi
        echo download new versions
        git fetch > /dev/null 2>&1
        git reset --hard origin/master > /dev/null 2>&1
        echo downloaded
    else
        echo "You have a new version."
        echo $MyVer
        exit 0
    fi
else
    if [ "$YN" == 0 ]
        read -p "Download vim?\n(y/n)>>" YN
        if [[ "$YN" != [yY] ]]; then
            exit 1
        fi
    fi
    echo download vim
    git clone --depth 1 git@github.com:vim/vim $VIMPATH > /dev/null 2>&1
    echo downloaded
    cd $VIMPATH
fi
echo configing now
./configure \
    --enable-fail-if-missing \
    --with-features=huge \
    --disable-selinux \
    --enable-perlinterp \
    --enable-python3interp \
    --enable-rubyinterp \
    --enable-luainterp \
    --with-ruby-command=$RUBYPATH \
    --with-lua-prefix=$LUAPATH \
    --enable-cscope \
    --enable-fontset \
    --enable-multibyte \
    vi_cv_path_python3="$PYTHONPATH"
echo configed\nmaking now
make > /dev/null 2>&1
echo maked
sudo make install > /dev/null 2>&1
echo finish to install vim.$GitHubVer
echo python_path=$PYTHONPATH
echo ruby_path=$RUBYPATH
echo lua_path=$LUAPATH
