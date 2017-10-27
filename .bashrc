# 空白を履歴に追記しない、重複履歴を保存しない
export HISTCONTROL=ignoreboth
export HISTIGNORE="fg*:bg*:history*:cd*"
export HISTSIZE=10000

alias vim='mvim -v'
alias vi=vim

source ~/homebrew/etc/bash_completion.d/git-prompt.sh
source ~/homebrew/etc/bash_completion.d/git-completion.bash
