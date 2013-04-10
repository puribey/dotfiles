# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="gianu"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git pow bundler)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:${PATH}

export PATH=$PATH:/usr/local/pgsql/bin

#export TERM='xterm-color'
#export TERM='xterm-256color'

#aliases
alias ls='ls -G'
alias ll='ls -lG'
alias sr='screen -r'

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"


export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

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

export PATH=/Users/gianu/.cabal/bin:$PATH

export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules
export JAVA_HOME=/Library/Java/jdk
export RBX_ROOT=$HOME/.rbenv/versions/rbx-2.0.0-dev
export PATH=$PATH:$RBX_ROOT/1.9/bin

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
