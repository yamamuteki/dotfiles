[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
export PATH=$PATH:/Applications/MacVim.app/Contents/MacOS
export PS1='\W $ '
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

#.bashrcがあれば読み込む
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
