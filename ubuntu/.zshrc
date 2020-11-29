ZSHHOME="${HOME}/dotfiles/ubuntu/zsh"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
    -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi
if [ -e ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

alias tmux="tmux -u2"

# tmuxの自動起動
# やりたいこと
# １自動でtmuxが起動　ok
# ２デタッチと同時に終了　ok
# ３アタッチリスト出力かつ選択して用意する
#

session=`tmux ls|wc -l`
if [[ -z "$TMUX" ]] ; then
    option=""
    if [[ $session -eq 0 ]]; then
        tmux new-session && exit
    elif [[ $session -ge 1 ]]; then
        tmux ls
        echo "if you use new session please type \"n\"."
        echo "which session?"
        echo -n ">>"
        read ID
        if [[ $ID = "n" ]]; then
            tmux new-session && exit
        elif [[ -n $ID ]]; then
            tmux attach -t "$ID" && exit
        fi
    fi
fi
