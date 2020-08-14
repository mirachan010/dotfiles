#cdコマンドの省略をして、ディレクトリのみで移動
setopt auto_cd
#コマンドミスを修正
setopt correct
#エイリアス
alias lst='ls -ltr --color=auto'
alias l='ls -ltr --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'
alias lla='ls -la --color=auto'
alias v='nvim'
alias vi='nvim'
alias vz='cd ~/dotfiles/zsh;nvim'
alias sag='sudo apt upgrade'
alias sad='sudo apt update --yes'
alias sadg='sudo apt update;sudo apt upgrade --yes'
alias sadga='sudo apt update;sudo apt upgrade --yes;sudo apt autoremove --yes'
alias sudo=\'sudo\'
alias ｃｄ='cd'
alias gdif='git diff'
