#!/bin/bash
function check() {
    if [ -e /media/disk1/backups/vim ]; then
        cd /media/disk1/backups/vim;
        echo checking vim version now.
        GitHubVer=$(git ls-remote origin |tail -1|awk '{print $2}'|sed 's/refs\/tags\///')
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
        git clone git@github.com:vim/vim /media/disk1/backups/vim > /dev/null 2>&1
        echo downloaded
        cd /media/disk1/backups/vim
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
        --with-lua-prefix=/home/mira/.anyenv/envs/luaenv/versions/5.4.0/ \
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
