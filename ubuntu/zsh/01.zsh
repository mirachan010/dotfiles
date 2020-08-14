#export LANGUAGE=ja_JP.UTF-8
#export LC_ALL=ja_JP.UTF-8
#export LC_CTYPE=ja_JP.UTF-8
#export LANG=ja_JP.UTF-8
#source $HOME/.zplug/init.zsh

export PYENV_ROOT="$HOME/.anyenv/envs/pyenv/"
export PATH="$PYENV_ROOT/bin:$HOME/.local/bin:$PATH"
eval "$(pyenv init -)"

export RBENV_ROOT="$HOME/.anyenv/envs/rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"



function powerline_precmd() {
    PS1="$(~/.local/bin/powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
