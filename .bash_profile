[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export PATH="$HOME/homebrew/bin:$PATH"
export HOMEBREW_CACHE="$HOME/homebrew/cache"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PS1='\W $ '
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

export XDG_CONFIG_HOME=$HOME/.config

#.bashrcがあれば読み込む
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
