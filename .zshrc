# export ZSH=/Users/nnoll/.oh-my-zsh
export ZSH=/home/monkey/.oh-my-zsh

ZSH_THEME="lambda"

DISABLE_AUTO_TITLE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ------------------
# User configuration
# ------------------

DEFAULT_USER=`whoami`

export EDITOR='vim'
# source ~/.bin/tmuxinator.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin
export GOBIN=$GOPATH/bin

# ----ALIASES------
alias v='vim'
alias conf='vim ~/.vimrc ~/.zshrc ~/.tmux.conf'
alias vimsource='source ~/.vimrc'
alias l='ls -lFh'     #size,show type,human readable
alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
alias t='tail -f'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias hgrep="fc -El 0 | grep"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias c='clear'
alias r='reset'
alias q='exit'

# ctags
alias tag='ctags -R -f .'

# tmux(inator)
alias tmuxls='tmux list-session'
alias muxls="ag -l yml ~/.tmuxinator/ | sed 's=.*/==' | cut -f 1 -d '.'"
alias mux='tmuxinator'

alias wttr='curl wttr.in/Munich'

# ------- fzf ---------- #
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fgb() {
  git fetch
  local branches branch
  branches=$(git branch -a) &&
  branch=$(echo "$branches" | fzf +s +m -e) &&
  git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")
}

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
