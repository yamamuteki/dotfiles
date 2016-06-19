[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

eval "$(rbenv init -)"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
export PS1='\W $ '
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

#.bashrcがあれば読み込む
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
