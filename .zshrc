# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="gianu"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git pow bundler)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export JAVA_HOME=/Library/Java/jdk
export RBX_ROOT=$HOME/.rbenv/versions/rbx-2.0.0-dev

export PATH=/usr/local/bin:${PATH}:/usr/local/pgsql/bin:$RBX_ROOT/1.9/bin
export PATH=/Users/gianu/.cabal/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/bin:$PATH

#export TERM='xterm-color'
export TERM='xterm-256color'

#aliases
alias ls='ls -G'
alias ll='ls -lG'
alias sr='screen -r'
alias t="script/test $*"

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"


export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

export EDITOR=vi

export ACK_COLOR_MATCH='red'

#export PYTHONDONTWRITEBYTECODE=1

export WORDCHARS='*?[]~&;!$%^<>'

activate_virtualenv() {
  if [ -f env/bin/activate ]; then . env/bin/activate;
  elif [ -f ../env/bin/activate ]; then . ../env/bin/activate;
  elif [ -f ../../env/bin/activate ]; then . ../../env/bin/activate;
  elif [ -f ../../../env/bin/activate ]; then . ../../../env/bin/activate;
  fi
}

function whodoneit() {
  (set -e &&
    for x in $(git grep -I --name-only $1); do
      git blame -f -- $x | grep $1;
    done
  )
}

function topcommiters() {
  echo "$(git shortlog -sn)"
}


# This fix an issue with the mysql2 gem
#export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/:$DYLD_LIBRARY_PATH
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
##export PATH="/usr/local/heroku/bin:$PATH"

if [[ -s $HOME/.nvm ]]; then 
  setopt nullglob 
  NVM_DIR=$HOME/.nvm 
  source $NVM_DIR/nvm.sh 
fi

# Rubinius Options
export RBXOPT=-X19
