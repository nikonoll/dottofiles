export ZSH=/Users/nnoll/.oh-my-zsh

ZSH_THEME="agnoster"

DISABLE_AUTO_TITLE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ------------------
# User configuration
# ------------------

DEFAULT_USER=`whoami`

export EDITOR='vim'
source ~/.bin/tmuxinator.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# ----ALIASES------
alias l='ls -lFh'     #size,show type,human readable
alias grep='grep --color'
alias greprn='grep -rn '
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

alias gs='git status'
alias gd='git diff'
alias ga.='git add .'
alias gcm='git commit -m '
