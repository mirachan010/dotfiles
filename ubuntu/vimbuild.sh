#!/bin/bash
function check() {
    if [ -e /tmp/vim ]; then
        cd /tmp/vim;
        echo checking vim version now.
        GitHubVer=$(git ls-remote origin |grep -E v8.2.|tail -1|awk '{print $2}'|sed 's/refs\/tags\///')
        MyVer=$(git tag|tail -1)
        #GitHubVer=$(git ls-remote origin HEAD| awk '{print $1}')
        #MyVer=$(git rev-parse HEAD)
        if [ "$GitHubVer" != "$MyVer" ]; then
            git fetch > /dev/null 2>&1
            echo download new versions
            git reset --hard origin/master > /dev/null 2>&1
            echo downloaded
        else
            echo "You have a new version."
            echo $MyVer
            exit 0
        fi
    else
        echo download vim
        git clone https://github.com/vim/vim /tmp/vim > /dev/null 2>&1
        echo downloaded
        cd /tmp/vim
    fi
}

function config() {
    ./configure \
        --enable-fail-if-missing \
        --with-features=huge \
        --disable-selinux \
        --enable-perlinterp \
        --enable-python3interp \
        --enable-rubyinterp \
        --enable-luainterp \
        --with-ruby-command=/home/mira/.anyenv/envs/rbenv/shims/ruby \
        --with-lua-prefix=/home/mira/.anyenv/envs/luaenv/versions/5.3.5/ \
        --enable-cscope \
        --enable-fontset \
        --enable-multibyte \
        vi_cv_path_python3="/home/mira/.anyenv/envs/pyenv/shims/python3"
}

check
echo configing now
config > /dev/null 2>&1
echo configed
echo making now
make > /dev/null 2>&1
echo maked
sudo make install > /dev/null 2>&1
echo finish to install vim.$GitHubVer
