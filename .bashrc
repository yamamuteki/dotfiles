# 空白を履歴に追記しない、重複履歴を保存しない
export HISTCONTROL=ignoreboth
export HISTIGNORE="fg*:bg*:history*:cd*"
export HISTSIZE=10000

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
