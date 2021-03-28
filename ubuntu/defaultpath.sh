VIMPATH="/media/disk1/backups/vim"
LUAPATH="/home/mira/.anyenv/envs/luaenv/versions/5.4.0/"
PYTHONPATH="$(which python3)"
RUBYPATH=$(which ruby)
YN=0
if [ -e ~/.localvimpath ]; then
    source ~/.localvimpath
else
    echo Read defaultpaths
    echo if you settings you need to write ~/.localvimpath
fi
