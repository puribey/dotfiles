setopt PROMPT_SUBST
autoload -U promptinit help_funcs
promptinit
help_funcs
prompt gianu

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Customize to your needs...
export JAVA_HOME=/Library/Java/jdk
export RBX_ROOT=$HOME/.rbenv/versions/rbx-2.0.0-dev
export PYTHON_HOME=/usr/local/Cellar/python/2.7.6
export MVN_HOME=/usr/local/apache-maven-3.1.1/

export PATH=/usr/local/bin:${PATH}:/usr/local/pgsql/bin:$RBX_ROOT/1.9/bin
export PATH=/Users/gianu/.cabal/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$PATH:/usr/local/sbin
export PATH=$PYTHON_HOME/bin:$PATH
export PATH=$PATH:$MVN_HOME/bin
export PATH=$PATH:/Library/SDK/PebbleSDK-2.0.2/bin

export TERM='xterm-256color'

#aliases
alias ls='ls -G'
alias ll='ls -lG'
alias sr='screen -r'
alias be='bundle exec'
alias a='script/test_all'
t() {
  if [ -e script/test ]; then
    script/test $*
  else
    rspec --color spec
  fi
}

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

# This fix an issue with the mysql2 gem
#export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/:$DYLD_LIBRARY_PATH
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Rubinius Options
export RBXOPT=-X19

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Virtualenvwrapper configuration
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
