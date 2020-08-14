set -U FZF_LEGACY_KEYBINDINGS 0
set -Ux PATH ~/.anyenv/bin $PATH
set -Ux fish_user_paths $HOME/.anyenv/bin $fish_user_paths
status --is-interactive; and source (anyenv init -|psub)
set -x PATH ~/.fzf/bin $PATH
set -x PATH $GOROOT/bin $PATH
set -x PATH $GOPATH/bin $PATH
set GHQ_SELECTOR fzf

